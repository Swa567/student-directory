@width = 80
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
      cohort.empty? ? cohort = :November : cohort = cohort.to_sym
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

def print_by_cohort(students)
  puts "which cohort would you like to print"
  selected_cohort = gets.chomp.capitalize.to_sym
    puts "#{selected_cohort} cohort".upcase.center(@width)
    students.each do |student|
          puts "#{student[:name]}".center(@width) if student[:cohort] == selected_cohort
    end
end

def print(students)
    index = 0
    while index < (students.count)
      # center each line individually it string slit over several line. Ruby's string class does not support centering a multi-line string.
      # use split/map/join combination => "our_str".lines.map { |line| line.strip.center(80) }.join("\n")
      puts "#{index+1}. #{students[index][:name]} (#{students[index][:cohort]} cohort)".center(@width)
      index += 1
    end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great #{names.count > 1 ? "students" : "student"}"
end

students = input_students
print_header
print(students)
print_by_cohort(students)
print_footer(students)