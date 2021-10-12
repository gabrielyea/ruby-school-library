module InputHandler
  Show_Prompt = lambda do |required_params, *message|
    puts message
    temp_args = {}
    required_params.each do |param|
      puts "Enter #{param}"
      input = gets.strip.to_s
      temp_args.merge!(param => input)
    end
    temp_args
  end

  Show_Prompt_With_Callback = lambda do |required_params, message, *args, callback:|
    result = nil
    loop do
      puts message
      op = Show_Prompt.call(required_params)
      result = callback.call(*args, op[:index].to_i)
      break if result
    end
    result
  end
end
