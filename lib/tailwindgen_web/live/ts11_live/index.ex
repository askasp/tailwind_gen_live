defmodule TailwindgenWeb.Ts11Live.Index do
  use TailwindgenWeb, :live_view

  alias Tailwindgen.Tsc11
  alias Tailwindgen.Tsc11.Ts11

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :ts11s, list_ts11s())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Ts11")
    |> assign(:ts11, Tsc11.get_ts11!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Ts11")
    |> assign(:ts11, %Ts11{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Ts11s")
    |> assign(:ts11, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    ts11 = Tsc11.get_ts11!(id)
    {:ok, _} = Tsc11.delete_ts11(ts11)

    {:noreply, assign(socket, :ts11s, list_ts11s())}
  end

  defp list_ts11s do
    Tsc11.list_ts11s()
  end
end
