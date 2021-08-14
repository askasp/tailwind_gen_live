defmodule TailwindgenWeb.PostsyvLive.FormComponent do
  use TailwindgenWeb, :live_component

  alias Tailwindgen.Test7

  @impl true
  def update(%{postsyv: postsyv} = assigns, socket) do
    changeset = Test7.change_postsyv(postsyv)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"postsyv" => postsyv_params}, socket) do
    changeset =
      socket.assigns.postsyv
      |> Test7.change_postsyv(postsyv_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"postsyv" => postsyv_params}, socket) do
    save_postsyv(socket, socket.assigns.action, postsyv_params)
  end

  defp save_postsyv(socket, :edit, postsyv_params) do
    case Test7.update_postsyv(socket.assigns.postsyv, postsyv_params) do
      {:ok, _postsyv} ->
        {:noreply,
         socket
         |> put_flash(:info, "Postsyv updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_postsyv(socket, :new, postsyv_params) do
    case Test7.create_postsyv(postsyv_params) do
      {:ok, _postsyv} ->
        {:noreply,
         socket
         |> put_flash(:info, "Postsyv created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
