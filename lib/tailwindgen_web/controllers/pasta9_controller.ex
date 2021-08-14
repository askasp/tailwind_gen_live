defmodule TailwindgenWeb.Pasta9Controller do
  use TailwindgenWeb, :controller

  alias Tailwindgen.Tcsat9
  alias Tailwindgen.Tcsat9.Pasta9

  def index(conn, _params) do
    pasta9s = Tcsat9.list_pasta9s()
    render(conn, "index.html", pasta9s: pasta9s)
  end

  def new(conn, _params) do
    changeset = Tcsat9.change_pasta9(%Pasta9{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"pasta9" => pasta9_params}) do
    case Tcsat9.create_pasta9(pasta9_params) do
      {:ok, pasta9} ->
        conn
        |> put_flash(:info, "Pasta9 created successfully.")
        |> redirect(to: Routes.pasta9_path(conn, :show, pasta9))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    pasta9 = Tcsat9.get_pasta9!(id)
    render(conn, "show.html", pasta9: pasta9)
  end

  def edit(conn, %{"id" => id}) do
    pasta9 = Tcsat9.get_pasta9!(id)
    changeset = Tcsat9.change_pasta9(pasta9)
    render(conn, "edit.html", pasta9: pasta9, changeset: changeset)
  end

  def update(conn, %{"id" => id, "pasta9" => pasta9_params}) do
    pasta9 = Tcsat9.get_pasta9!(id)

    case Tcsat9.update_pasta9(pasta9, pasta9_params) do
      {:ok, pasta9} ->
        conn
        |> put_flash(:info, "Pasta9 updated successfully.")
        |> redirect(to: Routes.pasta9_path(conn, :show, pasta9))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", pasta9: pasta9, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    pasta9 = Tcsat9.get_pasta9!(id)
    {:ok, _pasta9} = Tcsat9.delete_pasta9(pasta9)

    conn
    |> put_flash(:info, "Pasta9 deleted successfully.")
    |> redirect(to: Routes.pasta9_path(conn, :index))
  end
end
