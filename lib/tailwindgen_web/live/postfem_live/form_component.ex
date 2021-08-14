defmodule TailwindgenWeb.PostfemLive.FormComponent do
  use TailwindgenWeb, :live_component

  alias Tailwindgen.Test5

  @impl true
  def update(%{postfem: postfem} = assigns, socket) do
    changeset = Test5.change_postfem(postfem)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"postfem" => postfem_params}, socket) do
    changeset =
      socket.assigns.postfem
      |> Test5.change_postfem(postfem_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"postfem" => postfem_params}, socket) do
    save_postfem(socket, socket.assigns.action, postfem_params)
  end

  defp save_postfem(socket, :edit, postfem_params) do
    case Test5.update_postfem(socket.assigns.postfem, postfem_params) do
      {:ok, _postfem} ->
        {:noreply,
         socket
         |> put_flash(:info, "Postfem updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_postfem(socket, :new, postfem_params) do
    case Test5.create_postfem(postfem_params) do
      {:ok, _postfem} ->
        {:noreply,
         socket
         |> put_flash(:info, "Postfem created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
