require './person'
require './book'
require './student'
require './classroom'
require './rental'
require './teacher'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
    puts "Welcome to School library App!\n\n"
  end

  def run
    loop do
      puts '=' * 60
      puts display_options
      puts '=' * 60
      print 'Your option: '
      option = get_option
      try = option === 'Invalid option' ? 'Invalid option, please type correct number!' : available_options(option)
      puts try
      # break
    end
  end

  def display_options
    'Please choose an option by entering a number between 1 to 7:
    1 - List of all books
    2 - List of all people
    3 - Create a person
    4 - Create a book
    5 - Create a rental
    6 - List of all rental for given id
    7 - Exit'
  end

  def get_option
    user_choice = gets.chomp.to_i
    user_choice > 0 && user_choice <= 7 ? user_choice : "Invalid option"
  end

  def available_options(user_choice)
    case user_choice
    when 1
      list_books(@books)
    when 2
      list_people(@people)
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      list_rentals(@rentals)
    else
      puts 'Thank you for using our library!'
      exit
    end
  end

  def list_books
    puts "from book store"
  end

  def list_people
    puts "from person store"
  end

  def create_person
    puts "from create person"
  end

  def create_book
    puts "from create book"
  end

  def create_rental
    puts "from create rental"
  end

  def list_rentals
    puts "from list rentals"
  end

end
