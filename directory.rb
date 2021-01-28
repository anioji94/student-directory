def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close 
end

def interactive_menu
  @students = []
  loop do
    print_menu
    selection = gets.chomp
    process(selection)
  end
end

def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv "
  puts "9. Exit" # 9 because we'll be adding more items  
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



def show_students
  print_header
  print_students_list()
  print_footer(@students)
end




interactive_menu