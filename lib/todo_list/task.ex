defmodule TodoList.Task do
  use TodoList.Schema
  import Ecto.Changeset

  schema "tasks" do
    field :name, :string
    field :description, :string
    field :status, :string, default: "Not started"
    field :timestamp, :utc_datetime

    timestamps()
  end

  def changeset(task, params \\ %{}) do
    IO.inspect(task, label: "Task Before Changeset")
    IO.inspect(params, label: "Changeset Params")

    # Extract the "task" parameters from the received params
    task_params = Map.get(params, "task", %{})

    task
    |> cast(task_params, [:name, :description, :status])
    |> validate_required([:name, :description])
    |> IO.inspect(label: "Changeset Errors")
  end
end
