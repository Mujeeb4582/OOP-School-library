class RentalService
  def initialize(people, books)
    @rentals = if File.read(File.join('library_store', 'rentals.json')).empty?
                 []
               else
                 JSON.parse(File.read(File.join('library_store', 'rentals.json')))
               end
    @people = people
    @books = books
  end

  def create
    if @people.people.empty? || @books.books.empty?
      puts 'list are empty'
    else
      puts 'Select a book from the following list by number'
      @books.list
      book_number = gets.chomp.to_i
      book_name = @books.books[book_number]

      puts 'Select a person from the following list by number (not id)'
      @people.list
      person_number = gets.chomp.to_i
      person_name = @people.people[person_number]

      print 'Date[YYYY/MM/DD] :'
      date = gets.chomp
      rental = Rental.new(book_name, person_name, date)
      @rentals << rental.to_json
      write_to_file
      puts 'Rental created successfully'
    end
    nil
  end

  def list
    if @rentals.empty?
      puts 'No rentals found, please add some rentals to the list first.'
    else
      print 'ID of person: '
      person_id = gets.chomp.to_i
      selected_list = @rentals.select { |rental| rental['person_id'] == person_id }
      if selected_list.empty?
        puts "No rentals are found for (#{person_id})"
      else
        selected_list.each do |rental|
          puts "Date: #{rental['date']}, Book: #{rental['book_title']} by #{rental['book_author']}"
        end
      end
    end
    nil
  end

  def write_to_file
    json_data = JSON.pretty_generate(@rentals)
    File.write(File.join('library_store', 'rentals.json'), json_data)
  end
end
