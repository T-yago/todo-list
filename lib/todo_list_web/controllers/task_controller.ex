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

  def delete(conn, %{"id" => id}) do
    case Tasks.delete_task(id) do
      {:ok, _task} ->
        conn
        |> put_status(:no_content)
        |> send_resp(:no_content, "")

      {:error, :not_found} ->
        conn
        |> put_status(:not_found)
        |> send_resp(:not_found, "")

      {:error, :invalid_uuid} ->
        conn
        |> put_status(:bad_request)
        |> send_resp(:bad_request, "")

      {:error, :delete_error} ->
        conn
        |> put_status(:internal_server_error)
        |> send_resp(:internal_server_error, "")
    end
  end

  def update(conn, %{"id" => id}) do
    case Tasks.complete_task(id) do
      {:ok, task} ->
        conn
        |> put_status(:ok)
        |> render(:index, tasks: [task])

      {:error, :not_found} ->
        conn
        |> put_status(:not_found)

      {:error, :invalid_uuid} ->
        conn
        |> put_status(:bad_request)
    end
  end


end
