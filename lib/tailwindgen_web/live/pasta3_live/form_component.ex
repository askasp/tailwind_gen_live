defmodule TailwindgenWeb.Pasta3Live.FormComponent do
  use TailwindgenWeb, :live_component

  alias Tailwindgen.Tcsat3

  @impl true
  def update(%{pasta3: pasta3} = assigns, socket) do
    changeset = Tcsat3.change_pasta3(pasta3)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"pasta3" => pasta3_params}, socket) do
    changeset =
      socket.assigns.pasta3
      |> Tcsat3.change_pasta3(pasta3_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"pasta3" => pasta3_params}, socket) do
    save_pasta3(socket, socket.assigns.action, pasta3_params)
  end

  defp save_pasta3(socket, :edit, pasta3_params) do
    case Tcsat3.update_pasta3(socket.assigns.pasta3, pasta3_params) do
      {:ok, _pasta3} ->
        {:noreply,
         socket
         |> put_flash(:info, "Pasta3 updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_pasta3(socket, :new, pasta3_params) do
    case Tcsat3.create_pasta3(pasta3_params) do
      {:ok, _pasta3} ->
        {:noreply,
         socket
         |> put_flash(:info, "Pasta3 created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
