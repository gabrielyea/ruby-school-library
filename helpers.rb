module Helpers
  Type = Struct.new(:name, :required_params)
  Option = Struct.new(:desc, :ref)

  convert_to_instance = lambda do |name, obj|
    return 'None' unless obj.instance_variable_defined?("@#{name}")

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

  Display_By_Labels = lambda do |collection, title, labels|
    max = max_string_length.call(collection, labels)
    temp_string = '#..'
    labels.each { |label| temp_string += " #{label.to_s.capitalize.ljust(max + 2, '.')}" }

    puts "Total number of #{title}: #{collection.count}"
    puts
    puts temp_string
    puts

    collection.each_with_index do |obj, index|
      temp_string = "#{index + 1}.."
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
    Display_By_Labels.call(table, title, labels)
  end

  Display_By_Class_Name = lambda do |collection, title, labels|
    table = collection.map do |res|
      temp = Object.new
      temp.instance_variable_set(:@name, res.name)
      temp
    end
    Display_By_Labels.call(table, title, labels)
  end

  Get_By_Index = lambda do |collection, index|
    return collection[index] unless collection[index].nil? || index.negative?

    puts
    puts '**** INVALID INDEX TRY AGAIN ****'
    puts
    false
  end

  Create_Entity = lambda do |entity, store_list|
    temp_args = {}
    entity.required_params.each do |param|
      puts "Enter #{param}"
      input = gets.strip.to_s
      temp_args.merge!(param => input)
    end
    new_entity = entity.name.new(**temp_args)
    store_list << new_entity
    Clear_Display.call
    puts "#{entity.name} created!!"
    puts 'Hit enter to continue!'
    new_entity
  end

  Clear_Display = -> { system('clear') || system('cls') }
end
