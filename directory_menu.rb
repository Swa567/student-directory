def interactive_menu
  students = [] # variable is then available in several iterations of the loop
  loop do
  # 1. print the menu and sas the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
  # 2. read the inpeu and save it into a variable
    selection = gets.chomp
  # 3. do what the user has asked
    case selection
     when "1"
      students = input_students
     when "2"
      print_header
      print(students)
      print_footer(students)
     when "9"
      Exit # will cause the program to terminate
     else
      puts "I don't know what you meant, try again"
    end # unless option 9, loop starts again
  end 
end

def input_students
    puts "Please enter the name of the students and then his/her cohort"
    puts "To finish, just hit return twice"
    # create an empty array
    students_list = []
    # get the first name
    # alternative to chomp(), use gsub look for Regex "\n" and replace it with ""
    name = gets.gsub("\n", "").capitalize
    # while the name is not empty, reapeat this code
    while !name.empty? do
      # get student's cohort
      # alternative to chomp(), use gsub look for Regex "\n" and replace it with ""
      cohort = gets.gsub("\n", "").capitalize
      cohort.empty? ? cohort = :November : cohort = cohort.capitalize.to_sym
      # add the student hash to the array
      students_list << {name: name, cohort: cohort}
      #get another names from the user
      name = gets.chomp.capitalize
    end
    # return the array of students
    students_list
end

def print_header
  puts "The students of Villains Academy"
  puts "--------------"
end

def print(students)
  index = 0
  while index < (students.count)
    # center each line individually it string slit over several line. Ruby's string class does not support centering a multi-line string.
    # use split/map/join combination => "our_str".lines.map { |line| line.strip.center(80) }.join("\n")
    puts "#{index+1}. #{students[index][:name]} (#{students[index][:cohort]} cohort)".center(80)
    index += 1
  end
end

# def print_by_cohort(students)
#   students.each do |student_hash|
    
#   end
# end

def print_footer(names)
  puts "Overall, we have #{names.count} great #{names.count > 1 ? "students" : "student"}"
end

interactive_menu