def input_students
    puts "Please ente the neams of the students"
    puts "To finish, just hit return twice"
    # create an empty array
    students_list = []
    # get the first name
    name = gets.chomp.capitalize
    # while the name is not empty, reapeat this code
    while !name.empty? do
        # add the student hash to the array
        students_list << {name: name, cohort: :november}
        #get another names from the user
        name = gets.chomp
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
    puts "#{index+1}. #{students[index][:name]} (#{students[index][:cohort]} cohort)"
    index += 1
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)