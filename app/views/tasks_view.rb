class TasksView
  def list(tasks)
    tasks.each do |task|
        # 1 - [ ] Terminar Livecode: EM 1 hora 
        status = task.status == true ? "[X]" : "[ ]"
        puts "#{task.id} #{status} #{task.title}: #{task.description}"
    end
  end

  def ask_for(attr)
    puts "What's the Task #{attr}?"
    gets.chomp
  end
end