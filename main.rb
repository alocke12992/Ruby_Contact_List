@contact_arr =[]
@one_contact = {}
# one_contact.each_with_index do |h, i|
#   puts "#{i+1} - Name: #{h[:name]} Email: #{h[:email]}"
# end

def menu
  puts "*" * 40
  puts "----- Menu -----"
  puts "*" * 40
  puts "What would you like to do?"
  puts "\t1) List all contacts"
  puts "\t2) Add new contact"
  puts "\t3) Delete a contact"
  puts "\t4) Exit"
  user_input = gets.strip.downcase
  exit(0) if user_input == 'quit'
  user_input.to_i
end

def contact_input
  puts "What is the contact name?"
  @one_contact[:contact_name] = gets.strip
  puts "What is the contact's email?"
  @one_contact[:contact_email] = gets.strip
  @contact_arr << @one_contact
  puts "The following contact has been added:"
  @contact_arr.each_with_index do |h, i|
    puts "#{i+1}) - Name: #{h[:contact_name]} Email: #{h[:contact_email]}"
  end
  @one_contact = {}
end




while true
  case menu
    when 1
      puts 'Listing all contacts:'
        if @contact_arr == []
          puts 'There are no contacts'
          puts 'Would you like to add a contact? (Y/N)'
            add_contact = gets.strip.downcase
            if add_contact == "y"
              puts contact_input
            end
        else
          @contact_arr.each_with_index do |h, i|
            puts "#{i+1}) - Name: #{h[:contact_name]} Email: #{h[:contact_email]}"
          end
        end

    when 2
      contact_input

    when 3
      puts "Which contact would you like to delete? (choose a number)"
      puts @contact_arr.each_with_index do |item, i|
        puts "#{i+1}) - Name: #{item[:name]} Email: #{item[:email]}"
      end
      input = gets.strip.to_i
      puts "#{input} will be removed from the array."
      @contact_arr.delete_at(input -1)
      puts @contacts_arr
    when 4
      puts 'Goodbye'
      exit

    else
      puts 'Invalid input'
      menu
    end
  end
