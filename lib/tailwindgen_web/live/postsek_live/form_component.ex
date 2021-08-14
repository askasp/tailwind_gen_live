defmodule TailwindgenWeb.PostsekLive.FormComponent do
  use TailwindgenWeb, :live_component

  alias Tailwindgen.Test6

  @impl true
  def update(%{postsek: postsek} = assigns, socket) do
    changeset = Test6.change_postsek(postsek)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"postsek" => postsek_params}, socket) do
    changeset =
      socket.assigns.postsek
      |> Test6.change_postsek(postsek_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"postsek" => postsek_params}, socket) do
    save_postsek(socket, socket.assigns.action, postsek_params)
  end

  defp save_postsek(socket, :edit, postsek_params) do
    case Test6.update_postsek(socket.assigns.postsek, postsek_params) do
      {:ok, _postsek} ->
        {:noreply,
         socket
         |> put_flash(:info, "Postsek updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_postsek(socket, :new, postsek_params) do
    case Test6.create_postsek(postsek_params) do
      {:ok, _postsek} ->
        {:noreply,
         socket
         |> put_flash(:info, "Postsek created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
