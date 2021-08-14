defmodule TailwindgenWeb.Pasta2Live.FormComponent do
  use TailwindgenWeb, :live_component

  alias Tailwindgen.Tcsat2

  @impl true
  def update(%{pasta2: pasta2} = assigns, socket) do
    changeset = Tcsat2.change_pasta2(pasta2)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"pasta2" => pasta2_params}, socket) do
    changeset =
      socket.assigns.pasta2
      |> Tcsat2.change_pasta2(pasta2_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"pasta2" => pasta2_params}, socket) do
    save_pasta2(socket, socket.assigns.action, pasta2_params)
  end

  defp save_pasta2(socket, :edit, pasta2_params) do
    case Tcsat2.update_pasta2(socket.assigns.pasta2, pasta2_params) do
      {:ok, _pasta2} ->
        {:noreply,
         socket
         |> put_flash(:info, "Pasta2 updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_pasta2(socket, :new, pasta2_params) do
    case Tcsat2.create_pasta2(pasta2_params) do
      {:ok, _pasta2} ->
        {:noreply,
         socket
         |> put_flash(:info, "Pasta2 created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
