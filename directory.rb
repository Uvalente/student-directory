# frozen_string_literal: true

@students = []

def input_students
  puts 'Please enter the names of the students'
  puts 'To finish, just hit return twice'

  @name = STDIN.gets.chomp
  until @name.empty?
    add_students
    puts "Now we have #{@students.size} students"
    @name = STDIN.gets.chomp
  end
end

def add_students
  @students << { name: @name, cohort: :november }
end

def print_header
  puts 'The students of Villain Academy'
  puts '-------------'
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall we have #{@students.count} great students.\n\n"
end

def print_menu
  puts '1. Input the students'
  puts '2. Show the students'
  puts '3. Save the list to a file'
  puts '4. Load the list from students.csv'
  puts '9. Exit'
end

def show_students
  print_header
  print_students_list
  print_footer
end


def process(selection)
  feedback = "You selected #{selection}"
  case selection
  when '1'
    puts feedback
    input_students
  when '2'
    puts feedback
    show_students
  when '3'
    puts feedback
    save_students
  when '4'
    puts feedback + " choose which file to load"
    load_students(STDIN.gets.chomp)
  when '9'
    puts feedback
    exit
  else
    puts "I don't know what you meant, try again"
  end
end

def interactive_menu
  try_load_students
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def save_students
  puts "Insert file name to use"
  filename = STDIN.gets.chomp
  
  file = File.open(filename, "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename)
  file = File.open(filename, "r")
  file.readlines.each do |line|
    @name, cohort = line.chomp.split(",")
    add_students
  end
  file.close
end

def try_load_students
  filename = ARGV.first
  load_students_file if filename.nil?
  return if filename.nil?
  if File.exist?(filename)
    load_students(filename)
    puts "Loaded #{@students.size} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

def load_students_file
  if File.exist?("students.csv")
    load_students("students.csv")
    puts "Loaded automatically #{@students.size} students from students.csv"
  end
end

interactive_menu
