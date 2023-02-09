require './book'

class BookService
  attr_accessor :books

  def initialize
    file_path = File.join('library_store', 'books.json')
    File.write(file_path, '[]') unless File.exist?(file_path)
    file_content = File.read(file_path)
    @books = file_content.empty? ? [] : JSON.parse(file_content)
  rescue StandardError => e
    puts "Error: #{e.message} while loading books from file #{file_path}"
    @books = []
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
