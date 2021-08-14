defmodule TailwindgenWeb.PostaLive.FormComponent do
  use TailwindgenWeb, :live_component

  alias Tailwindgen.Tast

  @impl true
  def update(%{posta: posta} = assigns, socket) do
    changeset = Tast.change_posta(posta)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"posta" => posta_params}, socket) do
    changeset =
      socket.assigns.posta
      |> Tast.change_posta(posta_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"posta" => posta_params}, socket) do
    save_posta(socket, socket.assigns.action, posta_params)
  end

  defp save_posta(socket, :edit, posta_params) do
    case Tast.update_posta(socket.assigns.posta, posta_params) do
      {:ok, _posta} ->
        {:noreply,
         socket
         |> put_flash(:info, "Posta updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_posta(socket, :new, posta_params) do
    case Tast.create_posta(posta_params) do
      {:ok, _posta} ->
        {:noreply,
         socket
         |> put_flash(:info, "Posta created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
