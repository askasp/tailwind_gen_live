defmodule TailwindgenWeb.Pasta8Live.FormComponent do
  use TailwindgenWeb, :live_component

  alias Tailwindgen.Tcsat8

  @impl true
  def update(%{pasta8: pasta8} = assigns, socket) do
    changeset = Tcsat8.change_pasta8(pasta8)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"pasta8" => pasta8_params}, socket) do
    changeset =
      socket.assigns.pasta8
      |> Tcsat8.change_pasta8(pasta8_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"pasta8" => pasta8_params}, socket) do
    save_pasta8(socket, socket.assigns.action, pasta8_params)
  end

  defp save_pasta8(socket, :edit, pasta8_params) do
    case Tcsat8.update_pasta8(socket.assigns.pasta8, pasta8_params) do
      {:ok, _pasta8} ->
        {:noreply,
         socket
         |> put_flash(:info, "Pasta8 updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_pasta8(socket, :new, pasta8_params) do
    case Tcsat8.create_pasta8(pasta8_params) do
      {:ok, _pasta8} ->
        {:noreply,
         socket
         |> put_flash(:info, "Pasta8 created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
