require_relative '../models/task'
require_relative '../views/tasks_view'

class TasksController
  
  def initialize
    @view = TasksView.new
  end
  
  def add
    title = @view.ask_for("Title")
    description = @view.ask_for("Description")
    task = Task.new(title: title, description: description)
    task.save
  end

  def list
    tasks = Task.all
    @view.list(tasks)
  end

  def edit
    list
    id = @view.ask_for("ID").to_i
    title = @view.ask_for("title")
    description = @view.ask_for("description")

    task = Task.find(id).first
    task.title = title
    task.description = description
    task.save
  end

  def destroy
    id = @view.ask_for("ID").to_i
    Task.destroy(id)
  end

  def find
    id = @view.ask_for("ID").to_i
    task = Task.find(id)
    @view.list(task)
  end
end