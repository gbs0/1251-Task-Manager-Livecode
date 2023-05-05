require_relative 'app/models/task'
require_relative 'app/controllers/tasks_controller'
require_relative 'router'

tasks_controller = TasksController.new

router = Router.new(tasks_controller)
router.start