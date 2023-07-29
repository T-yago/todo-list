defmodule TodoListWeb.TaskController do
  use TodoListWeb, :controller

  alias TodoList.Tasks

def index(conn, _params) do
  tasks = Tasks.list_tasks()
  render(conn, :index, tasks: tasks)
end


def create(conn,params) do
  IO.inspect(params, label: "Request Params")
  case Tasks.create_task(params) do
    {:ok, task} ->
      conn
      |> put_status(:created)
      |> render(:index, tasks: [task])
  end
end

end
