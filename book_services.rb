require './book'

class BookService
  attr_accessor :books

  def initialize
    @books = if File.read(File.join('library_store', 'books.json')).empty?
               []
             else
               JSON.parse(File.read(File.join('library_store', 'books.json')))
             end
  end

  def create
    print 'Title: '
    book_title = gets.chomp
    print 'Author: '
    book_author = gets.chomp
    @books << Book.new(book_title, book_author).to_json
    write_to_file
    puts 'Book created successfully'
  end

  def list
    if @books.empty?
      puts 'No books found. Please add some books to the list.'
    else
      @books.each_with_index do |book, index|
        puts "#{index}) Title: #{book['title']}, Author: #{book['author']}"
      end
    end
    nil
  end

  def write_to_file
    json_data = JSON.pretty_generate(@books)
    File.write(File.join('library_store', 'books.json'), json_data)
  end
end
