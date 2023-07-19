defmodule TodoListWeb.TaskView do
  use TodoListWeb, :view

  def render("task.json", %{task: task}) do
    %{id: task.id, name: task.name, description: task.description, status: task.status, timestamp: task.timestamp, inserted_at: task.inserted_at, updated_at: task.updated_at}
  end
end
