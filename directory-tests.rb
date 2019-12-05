# frozen_string_literal: true

def input_students
  puts 'Please enter the names of the students'
  puts 'To finish, just hit return twice'

  students = []
  name = gets.chomp
  puts 'Insert cohort'
  cohort = gets.chomp
  cohort = 'default' if cohort.empty?
  until name.empty?
    students << { name: name, cohort: cohort }
    puts "Now we have #{students.size} students"
    puts 'Insert name'
    name = gets.chomp || 'test'
    break if name.empty?

    puts 'Insert cohort'
    cohort = gets.chomp
    cohort = 'default' if cohort.empty?
  end
  students
end

def print_header
  puts 'The students of Villain Academy'
  puts '-------------'
end

def print(students)
  classes = {}
  students.each do |student|
    student.each do |key, value|
      if key == :cohort
        classes[value.to_sym] ||= []
        classes[value.to_sym] << student[:name]
      end
    end
  end
  classes.each do |k, v|
    puts "The #{k} cohort students are #{v.join(', ')}" if v.size > 1
    puts "The #{k} cohort student is #{v.first}" if v.size == 1
  end
end

def print_footer(names)
  single_student = "Overall we have #{names.count} great student."
  multiple_students = "Overall we have #{names.count} great students."
  names.count > 1 ? puts(multiple_students) : puts(single_student)
end

students = input_students
unless students.empty?
  print_header
  print(students)
end
print_footer(students)
