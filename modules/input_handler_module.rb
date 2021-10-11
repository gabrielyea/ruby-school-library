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
    puts message
    op = Show_Prompt.call(required_params)
    callback.call(args, op)
  end
end
