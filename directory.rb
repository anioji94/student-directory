# first we print the list of students

def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    # create an empty array
    students = []
    # get first name
    name = gets.chomp
    # while the name is not empty, repeat this code
    while !name.empty? do 
        students << {name: name, cohort: :november}
        puts "Now we have #{students.count} students"
        # get another name from the user
        name = gets.chomp
    end
    # return array of students
    students 
end

def print_header
    puts "The students of Villains Academy"
    puts "--------------"
end

def print(students)
   students.each_with_index do |student, num|
        puts "#{num + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end 
end

# finally we print the total number of students
def print_footer(names)
    puts "Overall we have #{names.count} great students"
end

# nothing happens until we call all the methods
students = input_students 
print_header
print(students)
print_footer(students)



