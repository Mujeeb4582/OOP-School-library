require './book'

class BookService
  attr_accessor :books

  def initialize
    @books = []
  end

  def create
    print 'Title: '
    book_title = gets.chomp
    print 'Author: '
    book_author = gets.chomp
    @books << Book.new(book_title, book_author)
    puts 'Book created successfully'
  end

  def list
    if @books.empty?
      puts 'No books found. Please add some books to the list.'
    else
      @books.each_with_index do |book, index|
        puts "#{index}) Title: #{book.title}, Author: #{book.author}"
      end
    end
    nil
  end
end
