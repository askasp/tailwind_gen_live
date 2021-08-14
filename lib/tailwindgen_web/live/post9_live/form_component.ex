defmodule TailwindgenWeb.Post9Live.FormComponent do
  use TailwindgenWeb, :live_component

  alias Tailwindgen.Test9

  @impl true
  def update(%{post9: post9} = assigns, socket) do
    changeset = Test9.change_post9(post9)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"post9" => post9_params}, socket) do
    changeset =
      socket.assigns.post9
      |> Test9.change_post9(post9_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"post9" => post9_params}, socket) do
    save_post9(socket, socket.assigns.action, post9_params)
  end

  defp save_post9(socket, :edit, post9_params) do
    case Test9.update_post9(socket.assigns.post9, post9_params) do
      {:ok, _post9} ->
        {:noreply,
         socket
         |> put_flash(:info, "Post9 updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_post9(socket, :new, post9_params) do
    case Test9.create_post9(post9_params) do
      {:ok, _post9} ->
        {:noreply,
         socket
         |> put_flash(:info, "Post9 created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
