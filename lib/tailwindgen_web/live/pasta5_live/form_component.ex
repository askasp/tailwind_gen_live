defmodule TailwindgenWeb.Pasta5Live.FormComponent do
  use TailwindgenWeb, :live_component

  alias Tailwindgen.Tcsat5

  @impl true
  def update(%{pasta5: pasta5} = assigns, socket) do
    changeset = Tcsat5.change_pasta5(pasta5)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"pasta5" => pasta5_params}, socket) do
    changeset =
      socket.assigns.pasta5
      |> Tcsat5.change_pasta5(pasta5_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"pasta5" => pasta5_params}, socket) do
    save_pasta5(socket, socket.assigns.action, pasta5_params)
  end

  defp save_pasta5(socket, :edit, pasta5_params) do
    case Tcsat5.update_pasta5(socket.assigns.pasta5, pasta5_params) do
      {:ok, _pasta5} ->
        {:noreply,
         socket
         |> put_flash(:info, "Pasta5 updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_pasta5(socket, :new, pasta5_params) do
    case Tcsat5.create_pasta5(pasta5_params) do
      {:ok, _pasta5} ->
        {:noreply,
         socket
         |> put_flash(:info, "Pasta5 created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
