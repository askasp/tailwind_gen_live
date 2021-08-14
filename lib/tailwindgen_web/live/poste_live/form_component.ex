defmodule TailwindgenWeb.PosteLive.FormComponent do
  use TailwindgenWeb, :live_component

  alias Tailwindgen.Tgst

  @impl true
  def update(%{poste: poste} = assigns, socket) do
    changeset = Tgst.change_poste(poste)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"poste" => poste_params}, socket) do
    changeset =
      socket.assigns.poste
      |> Tgst.change_poste(poste_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"poste" => poste_params}, socket) do
    save_poste(socket, socket.assigns.action, poste_params)
  end

  defp save_poste(socket, :edit, poste_params) do
    case Tgst.update_poste(socket.assigns.poste, poste_params) do
      {:ok, _poste} ->
        {:noreply,
         socket
         |> put_flash(:info, "Poste updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_poste(socket, :new, poste_params) do
    case Tgst.create_poste(poste_params) do
      {:ok, _poste} ->
        {:noreply,
         socket
         |> put_flash(:info, "Poste created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
