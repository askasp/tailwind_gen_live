defmodule TailwindgenWeb.Ts10Live.Show do
  use TailwindgenWeb, :live_view

  alias Tailwindgen.Tsc10

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end


  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:ts10, Tsc10.get_ts10!(id))}
  end

  def handle_event("delete", %{"id" => id}, socket) do
    ts10 = Tsc10.get_ts10!(id)
    {:ok, _} = Tsc10.delete_ts10(ts10)

    {:noreply, assign(socket, :ts10s, list_ts10s())}
  end

  defp list_ts10s do
    Tsc10.list_ts10s()
  end




  defp page_title(:show), do: "Show Ts10"
  defp page_title(:edit), do: "Edit Ts10"
end
