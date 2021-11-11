# STUDENT DIRECTORY AS IT IS AT STEP 7
def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    # create an empty array
    students_list = []
    # get the first name
    # alternative to chomp(), use gsub look for Regex "\n" and replace it with "" .gsub("\n","")
    name = gets.chomp
    # while the name is not empty, reapeat this code
    while !name.empty? do
        # add the student hash to the arrays
        students_list << {name: name, cohort: :november}
        #get another names from the user
        # alternative to chomp(), use gsub look for Regex "\n" and replace it with ""
        name = gets.chomp
    end
    # return the array of students
    students_list
end

def print_headersss
  puts "The students of Villains Academy"
  puts "--------------"
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

# nothing is happening until we call the methods
# passing the students variable to the methods as an argument called 'names'
# This is because the methods don't have access to local variables defined outside them.
students = input_students
print_header
print(students)
print_footer(students)