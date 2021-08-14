defmodule TailwindgenWeb.PastaLive.FormComponent do
  use TailwindgenWeb, :live_component

  alias Tailwindgen.Tcsat

  @impl true
  def update(%{pasta: pasta} = assigns, socket) do
    changeset = Tcsat.change_pasta(pasta)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"pasta" => pasta_params}, socket) do
    changeset =
      socket.assigns.pasta
      |> Tcsat.change_pasta(pasta_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"pasta" => pasta_params}, socket) do
    save_pasta(socket, socket.assigns.action, pasta_params)
  end

  defp save_pasta(socket, :edit, pasta_params) do
    case Tcsat.update_pasta(socket.assigns.pasta, pasta_params) do
      {:ok, _pasta} ->
        {:noreply,
         socket
         |> put_flash(:info, "Pasta updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_pasta(socket, :new, pasta_params) do
    case Tcsat.create_pasta(pasta_params) do
      {:ok, _pasta} ->
        {:noreply,
         socket
         |> put_flash(:info, "Pasta created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
