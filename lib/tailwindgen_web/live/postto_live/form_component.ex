defmodule TailwindgenWeb.PosttoLive.FormComponent do
  use TailwindgenWeb, :live_component

  alias Tailwindgen.Test2

  @impl true
  def update(%{postto: postto} = assigns, socket) do
    changeset = Test2.change_postto(postto)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"postto" => postto_params}, socket) do
    changeset =
      socket.assigns.postto
      |> Test2.change_postto(postto_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"postto" => postto_params}, socket) do
    save_postto(socket, socket.assigns.action, postto_params)
  end

  defp save_postto(socket, :edit, postto_params) do
    case Test2.update_postto(socket.assigns.postto, postto_params) do
      {:ok, _postto} ->
        {:noreply,
         socket
         |> put_flash(:info, "Postto updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_postto(socket, :new, postto_params) do
    case Test2.create_postto(postto_params) do
      {:ok, _postto} ->
        {:noreply,
         socket
         |> put_flash(:info, "Postto created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
