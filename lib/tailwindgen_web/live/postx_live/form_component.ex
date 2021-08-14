defmodule TailwindgenWeb.PostxLive.FormComponent do
  use TailwindgenWeb, :live_component

  alias Tailwindgen.Tcst

  @impl true
  def update(%{postx: postx} = assigns, socket) do
    changeset = Tcst.change_postx(postx)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"postx" => postx_params}, socket) do
    changeset =
      socket.assigns.postx
      |> Tcst.change_postx(postx_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"postx" => postx_params}, socket) do
    save_postx(socket, socket.assigns.action, postx_params)
  end

  defp save_postx(socket, :edit, postx_params) do
    case Tcst.update_postx(socket.assigns.postx, postx_params) do
      {:ok, _postx} ->
        {:noreply,
         socket
         |> put_flash(:info, "Postx updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_postx(socket, :new, postx_params) do
    case Tcst.create_postx(postx_params) do
      {:ok, _postx} ->
        {:noreply,
         socket
         |> put_flash(:info, "Postx created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
