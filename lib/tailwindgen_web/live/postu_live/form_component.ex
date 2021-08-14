defmodule TailwindgenWeb.PostuLive.FormComponent do
  use TailwindgenWeb, :live_component

  alias Tailwindgen.Tust

  @impl true
  def update(%{postu: postu} = assigns, socket) do
    changeset = Tust.change_postu(postu)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"postu" => postu_params}, socket) do
    changeset =
      socket.assigns.postu
      |> Tust.change_postu(postu_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"postu" => postu_params}, socket) do
    save_postu(socket, socket.assigns.action, postu_params)
  end

  defp save_postu(socket, :edit, postu_params) do
    case Tust.update_postu(socket.assigns.postu, postu_params) do
      {:ok, _postu} ->
        {:noreply,
         socket
         |> put_flash(:info, "Postu updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_postu(socket, :new, postu_params) do
    case Tust.create_postu(postu_params) do
      {:ok, _postu} ->
        {:noreply,
         socket
         |> put_flash(:info, "Postu created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
