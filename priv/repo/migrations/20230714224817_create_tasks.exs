defmodule TodoList.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :description, :text
      add :timestamp, :utc_datetime
      add :status, :string
      timestamps()
    end
  end
end
