# frozen_string_literal: true

students = [
  'Dr. Hannibal Lecter',
  'Darth Vader',
  'Nurse Ratched',
  'Michael Corleone',
  'Alex Delarge',
  'The Wicked Witch of the West',
  'Terminator',
  'Freddy Krueger',
  'The Joker',
  'Joffrey Baratheon',
  'Norman Bates'
]

puts 'The students of Villain Academy'
puts '-------------'
students.each { |student| puts student }
puts "Overall we have #{students.count} great students."
