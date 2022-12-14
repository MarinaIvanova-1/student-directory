def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create an empty array
  students = []
  #get the first name
  name = gets.chomp
  #while the name is not empty repeat this code
  while !name.empty? do
    #ask for a cohort
    puts "Which cohort are they in?"
    cohort = gets.chomp
    cohort = "november" if cohort.empty?
    #add the student hash to the array
    students << {name: name, cohort: cohort}
    puts "Now we have #{students.count} students"
    #get another name from the user
    name = gets.chomp
  end
  #return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "------"
end

def print(student_list)
  puts "Which cohort would you like to print out?"
  target_cohort = gets.chomp
  student_list.each do |student|
    if student[:cohort].include?(target_cohort)
      puts "#{(student[:name])} (#{student[:cohort]} cohort)"
    end
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end


students = input_students
print_header
print(students)
print_footer(students)