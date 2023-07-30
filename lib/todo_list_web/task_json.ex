defmodule TodoListWeb.TaskJSON do
  use TodoListWeb, :view

  def index( %{tasks: tasks}) do
    %{data: render_tasks(tasks)}
  end

  defp render_tasks([]), do: []
  defp render_tasks([task | rest]) do
    [render_task(task) | render_tasks(rest)]
  end

  defp render_task(task) do
    %{id: task.id, name: task.name, description: task.description, status: task.status, timestamp: task.timestamp, inserted_at: task.inserted_at, updated_at: task.updated_at}
  end

end
