require_relative "../models/address_book"

class MenuController
  attr_accessor :address_book

  def initialize
    @address_book = AddressBook.new
  end

  def main_menu
    puts "Main Menu - #{@address_book.entries.count} entries"
    puts "1 - View all entries"
    puts "2 - View entry by index"
    puts "3 - Create an entry"
    puts "4 - Search for an entry"
    puts "5 - Import entries from a CSV"
    puts "6 - Exit"
    print "Enter your selection: "

    selection = gets.to_i
    
    case selection
    when 1
      system "clear"
      view_all_entries
      main_menu
    when 2
      system "clear"
      view_entry
      main_menu
    when 3
      system "clear"
      create_entry
      main_menu
    when 4
      system "clear"
      search_entries
      main_menu
    when 5
      system "clear"
      read_csv
      main_menu
    when 6
      puts "Good-bye!"
      exit(0)
    else
      system "clear"
      puts "Sorry, Tha is not a valid option"
      main_menu
    end
  end

  def view_all_entries
    system "clear"
    puts "All Entries"
    @address_book.entries.each do |entry|
      puts entry.to_s
      entry_submenu(entry)
    end
    system "clear"
    puts "End of entries"
  end

  def view_entry
    print "Index: "
    index = (gets.chomp.to_i - 1)
    entry = @address_book.entries[index]
    if entry
      puts entry.to_s
      entry_submenu(entry)
      system "clear"
    else
      puts "Invalid number"
      view_entry
    end
  end

  def create_entry
    system "clear"
    puts "New AddressBook Entry"

    print "Name: "
    name = gets.chomp
    print "Phone Number: "
    number = gets.chomp
    print "Email: "
    email = gets.chomp

    @address_book.add_entry(name, number, email)
    system "clear"
    puts "New entry created"
  end

  def search_entries

  end

  def read_csv

  end

  def entry_submenu(entry)
    puts "n - next entry"
    puts "d - delete entry"
    puts "e - edit this entry"
    puts "m - return to main menu"

    selection = gets.chomp

    case selection
    when 'n'
    when 'd'

    when 'e'

    when 'm'
      system "clear"
      main_menu
    else
      system "clear"
      puts "#{selectoin} is not a valid input"
      entries_submenu(entry)
    end
  end
end