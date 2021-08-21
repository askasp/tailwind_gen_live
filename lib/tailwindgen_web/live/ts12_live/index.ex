defmodule TailwindgenWeb.Ts12Live.Index do
  use TailwindgenWeb, :live_view

  alias Tailwindgen.Tsc12
  alias Tailwindgen.Tsc12.Ts12

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :ts12s, list_ts12s())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Ts12")
    |> assign(:ts12, Tsc12.get_ts12!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Ts12")
    |> assign(:ts12, %Ts12{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Ts12s")
    |> assign(:ts12, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    ts12 = Tsc12.get_ts12!(id)
    {:ok, _} = Tsc12.delete_ts12(ts12)

    {:noreply, assign(socket, :ts12s, list_ts12s())}
  end

  defp list_ts12s do
    Tsc12.list_ts12s()
  end
end
