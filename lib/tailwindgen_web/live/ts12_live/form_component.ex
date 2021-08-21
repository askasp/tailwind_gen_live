defmodule TailwindgenWeb.Ts12Live.FormComponent do
  use TailwindgenWeb, :live_component

  alias Tailwindgen.Tsc12

  @impl true
  def update(%{ts12: ts12} = assigns, socket) do
    changeset = Tsc12.change_ts12(ts12)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"ts12" => ts12_params}, socket) do
    changeset =
      socket.assigns.ts12
      |> Tsc12.change_ts12(ts12_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"ts12" => ts12_params}, socket) do
    save_ts12(socket, socket.assigns.action, ts12_params)
  end

  defp save_ts12(socket, :edit, ts12_params) do
    case Tsc12.update_ts12(socket.assigns.ts12, ts12_params) do
      {:ok, _ts12} ->
        {:noreply,
         socket
         |> put_flash(:info, "Ts12 updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_ts12(socket, :new, ts12_params) do
    case Tsc12.create_ts12(ts12_params) do
      {:ok, _ts12} ->
        {:noreply,
         socket
         |> put_flash(:info, "Ts12 created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
