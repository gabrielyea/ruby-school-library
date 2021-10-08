module Helpers
  convert_to_instance = lambda do |name, obj|
    return obj.class.name unless obj.instance_variable_defined?("@#{name}")

    obj.instance_variable_get("@#{name}")
  end

  max_string_length = lambda do |collection, labels|
    max = 0
    collection.each do |obj|
      labels.each do |label|
        convert_to_instance.call(label, obj).to_s.length > max && max = convert_to_instance.call(label, obj).to_s.length
      end
    end
    return max
  end

  List_Collection = lambda do |collection, title, labels, callback, *options|
    callback.call(collection, title, labels, *options)
  end

  Nomral_Display = lambda do |collection, title, labels|
    max = max_string_length.call(collection, labels)
    temp_string = ''
    labels.each { |label| temp_string += " #{label.to_s.capitalize.ljust(max + 2, '.')}" }

    puts "Total number of #{title}: #{collection.count}"
    puts
    puts temp_string
    puts

    collection.each do |obj|
      temp_string = ''
      labels.each { |label| temp_string += " #{convert_to_instance.call(label, obj).to_s.ljust(max + 2, '.')}" }
      puts temp_string
    end
    puts
  end

  Display_By_Id = lambda do |collection, title, labels, id|
    result = collection.select { |rent| rent.person.id == id }
    table = result.map do |res|
      temp = Object.new
      temp.instance_variable_set(:@date, res.date)
      temp.instance_variable_set(:@name, res.person.name)
      temp.instance_variable_set(:@title, res.book.title)
      temp
    end
    Nomral_Display.call(table, title, labels)
  end
end
