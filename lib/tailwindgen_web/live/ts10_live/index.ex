defmodule TailwindgenWeb.Ts10Live.Index do
  use TailwindgenWeb, :live_view

  alias Tailwindgen.Tsc10
  alias Tailwindgen.Tsc10.Ts10

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :ts10s, list_ts10s())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Ts10")
    |> assign(:ts10, Tsc10.get_ts10!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Ts10")
    |> assign(:ts10, %Ts10{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Ts10s")
    |> assign(:ts10, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    ts10 = Tsc10.get_ts10!(id)
    {:ok, _} = Tsc10.delete_ts10(ts10)

    {:noreply, assign(socket, :ts10s, list_ts10s())}
  end

  defp list_ts10s do
    Tsc10.list_ts10s()
  end
end
