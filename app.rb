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
      option = user_option
      puts option == 'Invalid option' ? 'Invalid option, please type correct number!' : available_options(option)
      # puts try
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

  def user_option
    user_choice = gets.chomp.to_i
    user_choice.positive? && user_choice <= 7 ? user_choice : 'Invalid option'
  end

  def available_options(user_choice)
    case user_choice
    when 1
      list_books
    when 2
      list_people
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      list_rentals
    else
      puts 'Thank you for using this app!'
      exit
    end
  end

  # ========================== show list of books ================================
  def list_books
    if @books.empty?
      puts 'No books found. Please add some books to the list.'
    else
      @books.each_with_index do |book, index|
        puts "#{index}) Title: #{book.title}, Author: #{book.author}"
      end
    end
    nil
  end

  # ========================= show list of people method =========================
  def list_people
    if @people.empty?
      puts 'No people found. Please add some people to the list first.'
    else
      @people.each_with_index do |person, index|
        puts "#{index}) [#{person.class}] ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
      end
    end
    nil
  end

  # ========================= Create a person method ==============================
  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    select_person = gets.chomp.to_i
    case select_person
    when 1
      create_student
    when 2
      create_teacher
    else
      puts "\n\n******** Invalid input, please try again!!! ************ \n\n"
      create_person
    end
  end

  def create_student
    print 'Age: '
    student_age = gets.chomp.to_i
    print 'Name: '
    student_name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp
    student = Student.new(student_age, student_name, parent_permission: parent_permission)
    @people << student
    puts 'Person created successfully'
  end

  def create_teacher
    print 'Age: '
    teacher_age = gets.chomp.to_i
    print 'Name: '
    teacher_name = gets.chomp
    print 'Specialization: '
    teacher_specialization = gets.chomp
    teacher = Teacher.new(teacher_specialization, teacher_age, teacher_name)
    @people << teacher
    puts 'Person created successfully'
  end

  # ========================= Create a book method =============================
  def create_book
    print 'Title: '
    book_title = gets.chomp
    print 'Author: '
    book_author = gets.chomp
    book = Book.new(book_title, book_author)
    @books << book
    puts 'Book created successfully'
  end

  # ========================= Create a rental method =============================
  def create_rental
    if @people.empty? || @books.empty?
      puts 'list are empty'
    else
      puts 'Select a book from the following list by number'
      list_books
      book_number = gets.chomp.to_i
      book_name = @books[book_number]

      puts 'Select a person from the following list by number (not id)'
      list_people
      person_number = gets.chomp.to_i
      person_name = @people[person_number]

      print 'Date:'
      date = gets.chomp
      rental = Rental.new(book_name, person_name, date)
      @rentals << rental
      puts 'Rental created successfully'
    end
    nil
  end

  # ========================== show list of rentals ================================
  def list_rentals
    if @rentals.empty?
      puts 'No rentals found, please add some rentals to the list first.'
    else
      print 'ID of person: '
      person_id = gets.chomp.to_i
      @rentals.each do |rental|
        if rental.person.id == person_id
          puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
        end
      end
    end
    nil
  end
end
