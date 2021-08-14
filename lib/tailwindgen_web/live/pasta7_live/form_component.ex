defmodule TailwindgenWeb.Pasta7Live.FormComponent do
  use TailwindgenWeb, :live_component

  alias Tailwindgen.Tcsat7

  @impl true
  def update(%{pasta7: pasta7} = assigns, socket) do
    changeset = Tcsat7.change_pasta7(pasta7)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"pasta7" => pasta7_params}, socket) do
    changeset =
      socket.assigns.pasta7
      |> Tcsat7.change_pasta7(pasta7_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"pasta7" => pasta7_params}, socket) do
    save_pasta7(socket, socket.assigns.action, pasta7_params)
  end

  defp save_pasta7(socket, :edit, pasta7_params) do
    case Tcsat7.update_pasta7(socket.assigns.pasta7, pasta7_params) do
      {:ok, _pasta7} ->
        {:noreply,
         socket
         |> put_flash(:info, "Pasta7 updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_pasta7(socket, :new, pasta7_params) do
    case Tcsat7.create_pasta7(pasta7_params) do
      {:ok, _pasta7} ->
        {:noreply,
         socket
         |> put_flash(:info, "Pasta7 created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
