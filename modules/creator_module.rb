module CreatorModule
  Create_Entity = lambda do |entity|
    new_entity = entity.name.new(**temp_args)
    store_list << new_entity
    puts "#{entity.name} created!!"
    puts 'Hit enter to continue!'
    p new_entity
    new_entity
  end
end
