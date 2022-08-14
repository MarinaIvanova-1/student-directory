require 'csv'
@students = []

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end  

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to the file"
  puts "4. Load the list from the file"
  puts "9. Exit"
end

def process(selection)
  case selection
    when "1"
      puts "Please enter the list of students"
      input_students
    when "2"
      puts "Loaded the list of students"
      show_students
    when "3"
      puts "List of students is saved"
      save_students
    when "4"
      puts "Loading the student list"
      load_students
    when "9"
      puts "Exit"
      exit
    else 
      puts "I don't know what you meant, please try again"
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #get the first name
  name = STDIN.gets.chomp
  #while the name is not empty repeat this code
  while !name.empty? do
    #add the student hash to the array
    add_student(name, cohort = "novermber")
    puts "Now we have #{@students.count} students"
    #get another name from the user
    name = STDIN.gets.chomp
  end
end

def show_students
  print_header
  print_students_list
  print_footer
end

def print_header
  puts "The students of Villains Academy"
  puts "------"
end

def print_students_list
  @students.each do |student|
    puts "#{(student[:name])} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students
  #open the file for writing
  puts "Please enter the name of the file to save"
  filename = STDIN.gets.chomp
  CSV.open(filename, "w") do |file|
    #iterate over the array of students 
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      file << student_data
    end
  end
  
end

def load_students(filename = "students.csv")
  File.open("students.csv", "r") do |file|
    file.readlines.each do |line|
      name, cohort = line.chomp.split(",")
      add_student(name, cohort = "november")
    end
  end
end

def try_load_students
  if ARGV.first.nil?
    filename = "students.csv"
  else
    filename = ARGV.first #first argument from the command line 
  end
  if File.exist?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else #if the file doesn't exist 
    puts "Sorry, #{filename} doesn't exist."
    exit #quit the program
  end 
end

def add_student(name, cohort = "november")
  @students << {name: name, cohort: cohort.to_sym}
end

def load_filename 
  #get the name of the currently executed file
  puts "Currently executing file is #{File.basename(__FILE__)}"
end

load_filename
try_load_students
interactive_menu