defmodule TailwindgenWeb.Ts11Live.FormComponent do
  use TailwindgenWeb, :live_component

  alias Tailwindgen.Tsc11

  @impl true
  def update(%{ts11: ts11} = assigns, socket) do
    changeset = Tsc11.change_ts11(ts11)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"ts11" => ts11_params}, socket) do
    changeset =
      socket.assigns.ts11
      |> Tsc11.change_ts11(ts11_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"ts11" => ts11_params}, socket) do
    save_ts11(socket, socket.assigns.action, ts11_params)
  end

  defp save_ts11(socket, :edit, ts11_params) do
    case Tsc11.update_ts11(socket.assigns.ts11, ts11_params) do
      {:ok, _ts11} ->
        {:noreply,
         socket
         |> put_flash(:info, "Ts11 updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_ts11(socket, :new, ts11_params) do
    case Tsc11.create_ts11(ts11_params) do
      {:ok, _ts11} ->
        {:noreply,
         socket
         |> put_flash(:info, "Ts11 created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
