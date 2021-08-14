defmodule TailwindgenWeb.PostoLive.FormComponent do
  use TailwindgenWeb, :live_component

  alias Tailwindgen.Tost

  @impl true
  def update(%{posto: posto} = assigns, socket) do
    changeset = Tost.change_posto(posto)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"posto" => posto_params}, socket) do
    changeset =
      socket.assigns.posto
      |> Tost.change_posto(posto_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"posto" => posto_params}, socket) do
    save_posto(socket, socket.assigns.action, posto_params)
  end

  defp save_posto(socket, :edit, posto_params) do
    case Tost.update_posto(socket.assigns.posto, posto_params) do
      {:ok, _posto} ->
        {:noreply,
         socket
         |> put_flash(:info, "Posto updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_posto(socket, :new, posto_params) do
    case Tost.create_posto(posto_params) do
      {:ok, _posto} ->
        {:noreply,
         socket
         |> put_flash(:info, "Posto created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
