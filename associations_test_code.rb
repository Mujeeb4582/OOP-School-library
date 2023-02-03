require './classroom'
require './person'
require './rental'
require './book'
require './student'

room = Classroom.new('A1')
student = Student.new(room, 16, 'John Doe')
room.add_student(student)

book = Book.new('War and Peace', 'Leo Tolstoy')
person = Person.new(30, 'Joe')
rental = Rental.new(book, person, '2023-02-03')

puts room.label
# Output: "A1"
puts room.students.first.name
# Output: "John Doe"
puts book.title
# Output: "War and Peace"
puts book.author
# Output: "Leo Tolstoy"
puts book.rentals.first.person
# Output: #<Person:0x00007fa6d88b1020>
puts person.rentals.first.book.title
# Output: "War and Peace"
puts rental.date
# Output: "2023-02-03"
