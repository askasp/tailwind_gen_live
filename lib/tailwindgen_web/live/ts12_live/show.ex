defmodule TailwindgenWeb.Ts12Live.Show do
  use TailwindgenWeb, :live_view

  alias Tailwindgen.Tsc12

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end


  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:ts12, Tsc12.get_ts12!(id))}
  end

  def handle_event("delete", %{"id" => id}, socket) do
    ts12 = Tsc12.get_ts12!(id)
    {:ok, _} = Tsc12.delete_ts12(ts12)

    {:noreply, assign(socket, :ts12s, list_ts12s())}
  end

  defp list_ts12s do
    Tsc12.list_ts12s()
  end




  defp page_title(:show), do: "Show Ts12"
  defp page_title(:edit), do: "Edit Ts12"
end
