defmodule TailwindgenWeb.Pasta6Live.FormComponent do
  use TailwindgenWeb, :live_component

  alias Tailwindgen.Tcsat6

  @impl true
  def update(%{pasta6: pasta6} = assigns, socket) do
    changeset = Tcsat6.change_pasta6(pasta6)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"pasta6" => pasta6_params}, socket) do
    changeset =
      socket.assigns.pasta6
      |> Tcsat6.change_pasta6(pasta6_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"pasta6" => pasta6_params}, socket) do
    save_pasta6(socket, socket.assigns.action, pasta6_params)
  end

  defp save_pasta6(socket, :edit, pasta6_params) do
    case Tcsat6.update_pasta6(socket.assigns.pasta6, pasta6_params) do
      {:ok, _pasta6} ->
        {:noreply,
         socket
         |> put_flash(:info, "Pasta6 updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_pasta6(socket, :new, pasta6_params) do
    case Tcsat6.create_pasta6(pasta6_params) do
      {:ok, _pasta6} ->
        {:noreply,
         socket
         |> put_flash(:info, "Pasta6 created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
