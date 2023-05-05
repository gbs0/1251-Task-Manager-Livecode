require 'sqlite3'

class Task

  DB = SQLite3::Database.new(File.open(File.join(File.dirname(__FILE__), '../db/tasks.sqlite')))

  attr_accessor :id, :title, :description, :status

  def initialize(attributes = {})
    @id = attributes[:id]
    @title = attributes[:title]
    @description = attributes[:description]
    @status = attributes[:status] || "false"
  end

  def self.all
    query = "SELECT * FROM tasks"
    DB.results_as_hash = true
    results = DB.execute(query)
    results.map do |task|
      Task.new(id: task["id"], title: task["title"], description: task["description"], status: task["status"])
    end
  end

  def self.find(id)
    query = "SELECT * FROM tasks WHERE id = ?"
    DB.results_as_hash = true
    results = DB.execute(query, id)
    results.map do |task|
      Task.new(id: task["id"], title: task["title"], description: task["description"], status: task["status"])
    end
  end

  def save
    if @id
      query = "UPDATE tasks SET title = ?, description = ?, status = ? WHERE id = ?"
      DB.execute(query, @title, @description, @status, @id)
    else
      query = "INSERT INTO tasks (title, description, status) VALUES (?, ?, ?)"
      DB.execute(query, @title, @description, @status)
    end
  end

  def self.destroy(id)
    query = "DELETE FROM tasks WHERE id = ?"
    DB.execute(query, id)
  end
end