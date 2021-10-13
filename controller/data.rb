require 'json'
require 'fileutils'

class DataController
  attr_accessor :books, :people, :rentals

  def initialize(books: [], people: [], rentals: [])
    @books = books
    @people = people
    @rentals = rentals
  end

  def save_data
    write_to_file('people', JSON.pretty_generate(@people))
    write_to_file('books', JSON.pretty_generate(@books))
    write_to_file('rentals', JSON.pretty_generate(@rentals))
    p 'Data Saved'
  end

  def load_from_file(*_file_name)
    create_files
    load_books
    load_students
    load_teachers
    load_rentals
  end

  private

  def create_files
    Dir.mkdir('./data') unless Dir.exist?('./data')
    FileUtils.touch('./data/books.json') unless File.exist?('./data/books.json')
    FileUtils.touch('./data/people.json') unless File.exist?('./data/people.json')
    FileUtils.touch('./data/rentals.json') unless File.exist?('./data/rentals.json')
  end

  def load_books()
    file = File.read('./data/books.json')
    obj = JSON.parse(file)
    return if obj.empty?

    obj.each do |o|
      @books << Kernel.const_get(o['type']).new(
        author: o['author'], title: o['title']
      )
    end
  end

  def load_students()
    file = File.read('./data/people.json')
    obj = JSON.parse(file).select { |o| o['type'] == 'Student' }
    return if obj.empty?

    obj.each do |o|
      @people << Kernel.const_get(o['type']).new(
        id: o['id'],
        classroom: o['classroom'],
        age: o['age'],
        name: o['name'],
        parent_permission: o['parent_permission']
      )
    end
  end

  def load_teachers()
    file = File.read('./data/people.json')
    obj = JSON.parse(file).select { |o| o['type'] == 'Teacher' }
    return if obj.empty?

    obj.each do |o|
      @people << Kernel.const_get(o['type']).new(
        id: o['id'], specialization: o['specialization'], age: o['age'], name: o['name']
      )
    end
  end

  def load_rentals()
    file = File.read('./data/rentals.json')
    obj = JSON.parse(file)
    return if obj.empty?

    obj.each do |o|
      person = people.select { |p| p.id == o['id'] }
      book = books.select { |b| b.title == o['book']['title'] }
      @rentals << Kernel.const_get(o['type']).new(
        date: o['date'], person: person[0], book: book[0]
      )
    end
  end

  def write_to_file(file_name, data)
    File.open("./data/#{file_name}.json", 'w')
    File.write("./data/#{file_name}.json", data, mode: 'w')
  end
end
