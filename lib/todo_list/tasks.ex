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

  def delete_task(id) do
    case Ecto.UUID.cast(id) do
      {:ok, binary_id} ->
        case Repo.get(Task, binary_id) do
          nil ->
            IO.puts("Task with ID #{binary_id} not found.")
            {:error, :not_found}

          task ->
            case Repo.delete(task) do
              {:ok, _deleted_task} ->
                IO.puts("Task with ID #{binary_id} deleted successfully.")
                {:ok, task}

              {:error, _changeset} ->
                IO.puts("Error deleting the task.")
                {:error, :delete_error}
            end
        end

      :error ->
        IO.puts("Invalid UUID format for ID.")
        {:error, :invalid_uuid}
    end
  end

  def complete_task(id) do
    case Ecto.UUID.cast(id) do
      {:ok, binary_id} ->
        case Repo.get(Task, binary_id) do
          nil ->
            {:error, :not_found}

          task ->
            changeset = Task.changeset(task, %{"status" => "Completed"})
            case Repo.update(changeset) do
              {:ok, updated_task} ->
                {:ok, updated_task}

              {:error, _changeset} ->
                {:error, task}
            end
        end

      :error ->
        {:error, :invalid_uuid}
    end
  end





end
