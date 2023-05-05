class Router
  def initialize(tasks_controller)
    @tasks_controller = tasks_controller
  end

  def start
    loop do
      choice = print_menu
      dispatch(choice)    
    end
  end
  
  def print_menu
    puts "Welcome to Task Manager!"
    puts "What action you want to perform?"
    puts "1. Create new Task"
    puts "2. List All Tasks"
    puts "3. Find Task"
    puts "4. Edit Task"
    puts "5. Destroy Task"
    puts "0. Quit"
    print "> "
    gets.chomp.to_i
  end
  
  def dispatch(choice)
    case choice
    when 1 then @tasks_controller.add
    when 2 then @tasks_controller.list
    when 3 then @tasks_controller.find
    when 4 then @tasks_controller.edit
    when 5 then @tasks_controller.destroy
    when 0 then exit
    else
      puts "Invalid Option!"
    end
  end
end