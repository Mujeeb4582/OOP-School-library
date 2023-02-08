class OptionSelector
  def available_options(user_choice, library)
    case user_choice
    when 1
      library.list_books
    when 2
      library.list_people
    when 3
      library.create_person
    when 4
      library.create_book
    when 5
      library.create_rental
    when 6
      library.list_rentals
    else
      puts "Thank you for using this app!\n\n"
      exit
    end
  end
end
