# first we print the list of students

def interactive_menu
  @students = []
  loop do
    print_menu
    selection = gets.chomp
    process(selection)
  end
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "9"
      exit # this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
  end
end


def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    # create an empty array
    # get first name
    name = gets.chomp
    # type "end" to close the list.
    puts "What cohort do they belong to?"
    cohort = gets.chomp
    while !name.empty? do 
        @students << {name: name, cohort: cohort.to_sym}
        puts "Now we have #{@students.count} students"
        # get another name from the user
        puts "Would you like to add more?"
        name = gets.chomp
        puts "What cohort do they belong to?"
        cohort = gets.chomp
    end
    # return array of students
end

def print_header
    puts "The students of Villains Academy"
    puts "--------------"
end

def print_students_list
   @students.each_with_index do |student, num|
        puts "#{num + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end 
end

# finally we print the total number of students
def print_footer(names)
    puts "Overall we have #{names.count} great students"
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit" # 9 because we'll be adding more items  
end

def show_students
  print_header
  print_students_list()
  print_footer(@students)
end

interactive_menu