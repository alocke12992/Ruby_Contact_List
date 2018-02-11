@contact_arr =[]
@one_contact = {}
@regex_num = /\S\d/
require 'pry'
require 'colorize'

# =============== SINGLE CONTACT ==============#
def one_contact  
  puts "Name: #{@one_contact[:contact_name]}".colorize(:green)
  puts "Email: #{@one_contact[:contact_email]}".colorize(:green)
  
end 

# =============== INPUT CONTACT ==============# 

def add_contact
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

# =============== FORMAT CONTACT ==============#

def contacts_clean(input)
  @contact_arr.each_with_index do |h, i|
  puts "#{i+1}) - Name: #{h[:contact_name]} Email: #{h[:contact_email]}\n".colorize(:green)
  end
end 

def clean_one(input)
  puts "Name: #{@one_contact[:contact_name]} Email: #{@one_contact[:contact_email]}\n".colorize(:green)
end 

# =============== LIST ALL CONTACTS ==============#

def list_contacts
  if @contact_arr == []
    puts 'Sorry, it looks like you do not have any contacts.'
    puts 'Would you like to add a contact? (Y/N)'
    choice = gets.strip.downcase
    if choice == "y"
      add_contact
    end
  else
  puts "-" * 40
  puts 'Listing Contacts:'
  puts "-" * 40 
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
    puts "The following contact has been deleted"
    @one_contact = @contact_arr[input -1]
    @contact_arr.delete_at(input -1)
    clean_one(@one_contact)
    @one_contact = {}
  end
end  

def edit_contact
  if @contact_arr == [] 
    puts "There are no currently no contacts"
  else 
    puts "Which contact would you like to edit?"
    contacts_clean(@contact_arr)
    user_input = gets.strip.to_i
    @one_contact = @contact_arr[user_input - 1]
    edit_item
  end
end 



def edit_item 
  puts "You are editing:" 
  clean_one(@one_contact)
  puts "What would you like to edit?"
  puts "1) Contact Name"
  puts "2) Contact Email"
  puts "3) Both Contact Name and Email"
  choice = gets.strip.to_i
  if choice == 1 
    puts "What would you like the new Name to be?"
    name_input = gets.strip 
    @one_contact[:contact_name] = name_input
  elsif choice == 2 
    puts "what would you like the new Email to be?"
    email_input = gets.strip 
    @one_contact[:contact_email] = email_input
  elsif choice == 3 
    edit_both 
  else 
    puts "Invalid input, please try again"
    edit_item 
  end 
  puts "The following contact has been edited:"
  clean_one(@one_contact)
  @one_contact = {}

end 

def edit_both 
  puts "What would you like the new Name to be?"
  name_input = gets.strip 
  @one_contact[:contact_name] = name_input
  puts "what would you like the new Email to be?"
  email_input = gets.strip 
  @one_contact[:contact_email] = email_input

end 

def edit 
  puts "*".colorize(:blue) * 40
  puts "--------------- Contacts ---------------".colorize(:blue) 
  puts "----------------- Edit -----------------".colorize(:blue)
  puts "*".colorize(:blue)  * 40
  puts "Please Choose from the following:\n".colorize(:blue) 
  puts "1) Add Contact"
  puts "2) Delete Contact" 
  puts "3) Edit Contacts"
  puts "4) Main Menu"
  user_input = gets.strip.to_i  
  if user_input == 1
      add_contact 
      edit
  elsif user_input == 2
      delete_contact 
      edit
  elsif user_input == 3
      edit_contact
      edit
  elsif user_input == 4
    menu_exit
  else 
    puts "Error. Invalid selection.".colorize(:red)
    edit
  end 
end 

def menu_exit
end 


  def menu
    puts "*".colorize(:cyan) * 40
    puts "--------------- Contacts ---------------".colorize(:cyan)
    puts "--------------- Main Menu --------------".colorize(:cyan)
    puts "*".colorize(:cyan) * 40
    puts "What would you like to do?"
    puts "1) View Contacts"
    puts "2) Edit Contacts"
    puts "3) Exit"
    user_input = gets.strip.downcase
    exit(0) if user_input == 'quit'
    user_input.to_i
  end
  
 
while true
  case menu
    when 1
      list_contacts
    when 2
      edit
    when 3
      
      puts 'Goodbye'.colorize(:cyan)
      exit

    else
      puts 'Invalid input'.colorize(:red)
      menu
  end
end
