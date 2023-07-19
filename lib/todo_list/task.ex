defmodule TodoList.Task do
  use TodoList.Schema

  schema "tasks" do
    field :name, :string
    field :description, :string
    # TODO: Ecto.Enum
    field :status, :string, default: "Not started"
    field :timestamp, :utc_datetime

    # inserted_at & updated_at
    timestamps()
  end

  def changeset(task, params \\ %{}) do
    task
    |> cast(params, [:name, :description, :state])
    |> validate_required([:name, :description])
  end
end
