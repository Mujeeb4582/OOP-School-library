require './person'

class PersonService
  attr_accessor :people

  def initialize
    file_path = File.join('library_store', 'persons.json')
    File.write(file_path, '[]') unless File.exist?(file_path)
    file_content = File.read(file_path)
    @people = file_content.empty? ? [] : JSON.parse(file_content)
  rescue StandardError => e
    puts "ERROR: #{e.message} while loading persons from file #{file_path}"
    @people = []
  end

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
    parent_permission = gets.chomp.upcase
    case parent_permission
    when 'Y'
      parent_permission = true
    when 'N'
      parent_permission = false
    else
      puts "That is not a valid input. Please try again!!!.\n\n"
      create_student
    end
    student = Student.new(student_age, student_name, parent_permission: parent_permission)
    @people << student.to_json
    write_to_file
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
    @people << teacher.to_json
    write_to_file
    puts 'Person created successfully'
  end

  def list
    if @people.empty?
      puts 'No people found. Please add some people to the list first.'
    else
      @people.each_with_index do |person, index|
        puts "#{index}) [#{person['class']}] ID: #{person['id']}, Name: #{person['name']}, Age: #{person['age']}"
      end
    end
    nil
  end

  def write_to_file
    json_data = JSON.pretty_generate(@people)
    File.write(File.join('library_store', 'persons.json'), json_data)
  end
end
