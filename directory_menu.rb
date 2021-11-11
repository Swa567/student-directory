def interactive_menu
  @students = [] # instance variable accessible to ALL methods
  loop do
    print_menu
    process(gets.chomp)
  end 
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "9"
      Exit # will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
  end # unless option 9, loop starts again
end

def print_menu
  # 1. print the menu and ask the user what to do
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

def show_students
  print_header
  print
  print_footer
end

def input_students
    puts "Please enter the name of the students and then his/her cohort"
    puts "To finish, just hit return twice"
    name = gets.gsub("\n", "").capitalize
    # while the name is not empty, reapeat this code
    while !name.empty? do
      # get student's cohort
      # alternative to chomp(), use gsub look for Regex "\n" and replace it with ""
      cohort = gets.gsub("\n", "").capitalize
      cohort.empty? ? cohort = :November : cohort = cohort.capitalize.to_sym
      # add the student hash to the array
      @students << {name: name, cohort: cohort}
      #get another names from the user
      name = gets.chomp.capitalize
    end
    # return the array of students => @students accessible to ALL methods
end

def print_header
  puts "The students of Villains Academy"
  puts "--------------"
end

def print
  index = 0
  while index < (@students.count)
    # center each line individually it string slit over several line. Ruby's string class does not support centering a multi-line string.
    # use split/map/join combination => "our_str".lines.map { |line| line.strip.center(80) }.join("\n")
    puts "#{index+1}. #{@students[index][:name]} (#{@students[index][:cohort]} cohort)".center(80)
    index += 1
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great #{@students.count > 1 ? "students" : "student"}"
end

interactive_menu