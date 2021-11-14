require 'csv' # require library

@students = [] # empty array accessible to ALL methods
@width = 60
@loaded_file= ""
@default_filename = "students.csv"

def input_students
    puts "Please enter the name of the students and then his/her cohort"
    puts "To finish, just hit return twice"
    name = STDIN.gets.chomp.capitalize
    while !name.empty do
      cohort = STDIN.gets.chomp.capitalize
      cohort.empty? ? cohort = :November : cohort = cohort.capitalize.to_sym
      name = STDIN.gets.chomp.capitalize
      add_students(name, cohort)
    end
    puts "thank your for adding #{@students.count} students to Villain Academy"
end

def add_students(name, cohort)
    @students << {name: name, cohort: cohort}
endss

def interactive_menusss
  loop do
    puts "Please select an options"
    puts
    print_menu
    process(STDIN.gets.chomp)
  end 
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "5. Show the students from a specific cohort"
  puts "9. Exit"
  puts
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
    when "5"
      print_by_cohort
    when "9"
      Exit
    else
      puts "I don't know what you meant, try again"
  end # unless option 9, loop starts again
end

def save_students(filename = @default_filename) # default value for filename if it;s not given
  # using CSV Class
  CSV.open(filename, "wb") do |csv|
    @students.each do |student|
      csv << [student[:name]], [student[:cohort]], [student[:main_subject]]
    end
  @loaded_file = filename
  puts
  puts  "*** Saved successfully to #{filename} ***"
  puts
end 

def load_options
  filename = ARGV.first # first argument from the command line
  # load default file if no file name is given
  if filename.nil?
    puts
    puts "Loaded default file: students.csv"
    load_students
  # load a specific file if the filename exists
  elsif File.exists?(filename)
    load_students(filename)
    puts
    puts "Loaded #{@students.count} from #{@filename}".center(@width)
  # if the filename doesn't exist
  else
    puts
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end 

def load_students(filename = @default_filename) # default value for filename if it;s not given
  if CSV.foreach(filename) do |row|  # the primary interface for reading CSV files: Each row of file will be passed to the provided block in turn.
      name, cohort = row
      add_student(name, cohort)
    end
end

def print_by_cohort
  puts "which cohort would you like to print"
  selected_cohort = gets.chomp.capitalize.to_sym
  puts "#{selected_cohort} cohort".upcase.center(@width)
    @students.each do |student|
      puts "#{student[:name]}".center(@width) if student[:cohort] == selected_cohort
    end
  puts "_" * @width
end

def print_header
  puts "The students of Villains Academy"
  puts "_" * @width
end

def print_student_list
  index = 0
  while index < (@students.count)
    puts "#{index+1}. #{@students[index][:name]} (#{@students[index][:cohort]} cohort)"
    index += 1
  end
  puts "_" * @width
end

def print_footer
  puts "Overall, we have #{@students.count} great #{@students.count > 1 ? "students" : "student"}"
end

load_options
interactive_menu