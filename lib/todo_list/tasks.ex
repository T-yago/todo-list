defmodule TodoList.Tasks do
  alias TodoList.Repo
  alias TodoList.Task

  def list_tasks() do
    # SELECT * FROM tasks;
    Task
    |> Repo.all()
  end

  def create_task(params \\ %{}) do
    # INSERT INTO tasks VALUES `params`;
    %Task{}
    # Verificar se os params cumprem os "requisitos"
    |> Task.changeset(params)
    |> Repo.insert()
  end
end
