defmodule TailwindgenWeb.Ts10Live.FormComponent do
  use TailwindgenWeb, :live_component

  alias Tailwindgen.Tsc10

  @impl true
  def update(%{ts10: ts10} = assigns, socket) do
    changeset = Tsc10.change_ts10(ts10)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"ts10" => ts10_params}, socket) do
    changeset =
      socket.assigns.ts10
      |> Tsc10.change_ts10(ts10_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"ts10" => ts10_params}, socket) do
    save_ts10(socket, socket.assigns.action, ts10_params)
  end

  defp save_ts10(socket, :edit, ts10_params) do
    case Tsc10.update_ts10(socket.assigns.ts10, ts10_params) do
      {:ok, _ts10} ->
        {:noreply,
         socket
         |> put_flash(:info, "Ts10 updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_ts10(socket, :new, ts10_params) do
    case Tsc10.create_ts10(ts10_params) do
      {:ok, _ts10} ->
        {:noreply,
         socket
         |> put_flash(:info, "Ts10 created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
