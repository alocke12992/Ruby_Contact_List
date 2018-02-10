@contact_arr =[]
@one_contact = {}
@regex_num = /\S\d/
require 'pry'

# =============== SINGLE CONTACT ==============#
def one_contact  
  puts "Name: #{@one_contact[:contact_name]}"
  puts "Email: #{@one_contact[:contact_email]}"
  
end 

# =============== INPUT CONTACT ==============# 

def contact_input
  puts "What is the contact name?"
  @one_contact[:contact_name] = gets.strip
  puts "What is the contact's email?"
  @one_contact[:contact_email] = gets.strip
  puts "\nThe following contact has been added:"
  one_contact
  @contact_arr << @one_contact
  @one_contact = {}
  puts
end

# =============== CLEAN CONTACT ==============#

def contacts_clean(input)
  @contact_arr.each_with_index do |h, i|
  puts "#{i+1}) - Name: #{h[:contact_name]} Email: #{h[:contact_email]}"
  end
end 

# =============== LIST ALL CONTACTS ==============#

def list_contacts
  puts 'Listing all contacts:'
  if @contact_arr == []
    puts 'There are no contacts'
    puts 'Would you like to add a contact? (Y/N)'
    add_contact = gets.strip.downcase
    if add_contact == "y"
      contact_input
    end
  else
    contacts_clean(@contact_arr)
  end
end

# =============== DELETE CONTACT ==============#

def delete_contact
  if @contact_arr == [] 
    puts "There are no currently no contacts"
  else 
    puts "Which contact would you like to delete?"
    contacts_clean(@contact_arr)
    input = gets.strip.to_i
    puts "The following contact will be deleted:"
    contacts_clean(input)
    @contact_arr.delete_at(input -1)
  end
end  

def edit_contact
  if @contact_arr == [] 
    puts "There are no currently no contacts"
  else 
    puts "Which contact would you like to edit?"
    contacts_clean(@contact_arr)
    user_input = gets.strip.to_i
    puts "You are editing:" 
    contacts_clean(user_input)
   @one_contact = @contact_arr[user_input - 1]
  end
  puts "What would you like the new Name to be?"
  name_input = gets.strip 
  @one_contact[:contact_name] = name_input

  puts "what would you like the new Email to be?"
  email_input = gets.strip 
  @one_contact[:contact_email] = email_input
  puts @one_contact 
end 

  # def edit_contact_element
  #   puts "Which element would you like to edit?"
  #   puts "1) Name"
  #   puts "2) Email"
  #   user_input = gets.strip.to_i 

  #     if element_input == 1
  #       puts "What would you like the new name to be?"
  #       user_input = gets.strip

  #     contacts_clean(input)
  #     @contact_arr[input -1]
  #   end
  # end 

  def menu
    puts "*" * 40
    puts "--------------- Contacts ---------------"
    puts "*" * 40
    puts "What would you like to do?"
    puts "\t1) View all contacts"
    puts "\t2) Add new contact"
    puts "\t3) Delete a contact"
    puts "\t4) Edit Contacts"
    puts "\t5) Exit"
    user_input = gets.strip.downcase
    exit(0) if user_input == 'quit'
    user_input.to_i
  end
  



while true
  case menu
    when 1
      list_contacts
    when 2
      contact_input
    when 3
      delete_contact
    when 4
      edit_contact
    when 5 
      puts 'Goodbye'
      exit

    else
      puts 'Invalid input'
      menu
  end
end
