 @students = [] # empty array accessible to ALL methods

def input_students
    puts "Please enter the name of the students and then his/her cohort"
    puts "To finish, just hit return twice"
    name = gets.chomp.capitalize
    # while the name is not empty, reapeat this code
    while !name.empty? do
      # get student's cohort
      cohort = gets.chomp.capitalize
      cohort.empty? ? cohort = :November : cohort = cohort.capitalize.to_sym
      # add the student hash to the array
      @students << {name: name, cohort: cohort}
      #get another names from the user
      name = gets.chomp.capitalize
    end
    # return the array of students => @students accessible to ALL methods
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end 
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. save the list to students.csv"
  puts "4. load the list from students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_student_list
  print_footer
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      Exit # will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
  end # unless option 9, loop starts again
end

def save_students
  # open the file for writting
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]] # convert Hash to Array
    csv_line = student_data.join(",") # convert to comma-separated String 
    file.puts csv_line
  end
  file.close
end

def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",") # parallel assignement => 1st element of the array to 1st var
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end  

def print_header
  puts "The students of Villains Academy"
  puts "--------------"
end

def print_student_list
  index = 0
  while index < (@students.count)
    puts "#{index+1}. #{@students[index][:name]} (#{@students[index][:cohort]} cohort)"
    index += 1
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great #{@students.count > 1 ? "students" : "student"}"
end

interactive_menu