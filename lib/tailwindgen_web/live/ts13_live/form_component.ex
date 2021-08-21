defmodule TailwindgenWeb.Ts13Live.FormComponent do
  use TailwindgenWeb, :live_component

  alias Tailwindgen.Tsc13

  @impl true
  def update(%{ts13: ts13} = assigns, socket) do
    changeset = Tsc13.change_ts13(ts13)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"ts13" => ts13_params}, socket) do
    changeset =
      socket.assigns.ts13
      |> Tsc13.change_ts13(ts13_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"ts13" => ts13_params}, socket) do
    save_ts13(socket, socket.assigns.action, ts13_params)
  end

  defp save_ts13(socket, :edit, ts13_params) do
    case Tsc13.update_ts13(socket.assigns.ts13, ts13_params) do
      {:ok, _ts13} ->
        {:noreply,
         socket
         |> put_flash(:info, "Ts13 updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_ts13(socket, :new, ts13_params) do
    case Tsc13.create_ts13(ts13_params) do
      {:ok, _ts13} ->
        {:noreply,
         socket
         |> put_flash(:info, "Ts13 created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
