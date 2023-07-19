defmodule TodoListWeb.TaskController do
  use TodoListWeb, :controller

  alias TodoList.Tasks
  alias TodoListWeb.TaskJSON

  def index(conn, _params) do
    tasks = Tasks.list_tasks()
    render(conn, "index.json", tasks: tasks, view: TaskJSON)
  end
end
