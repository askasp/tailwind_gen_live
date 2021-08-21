defmodule TailwindgenWeb.Ts13Live.Index do
  use TailwindgenWeb, :live_view

  alias Tailwindgen.Tsc13
  alias Tailwindgen.Tsc13.Ts13

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :ts13s, list_ts13s())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Ts13")
    |> assign(:ts13, Tsc13.get_ts13!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Ts13")
    |> assign(:ts13, %Ts13{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Ts13s")
    |> assign(:ts13, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    ts13 = Tsc13.get_ts13!(id)
    {:ok, _} = Tsc13.delete_ts13(ts13)

    {:noreply, assign(socket, :ts13s, list_ts13s())}
  end

  defp list_ts13s do
    Tsc13.list_ts13s()
  end
end
