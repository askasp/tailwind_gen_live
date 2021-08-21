defmodule TailwindgenWeb.Ts11Live.Show do
  use TailwindgenWeb, :live_view

  alias Tailwindgen.Tsc11

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end


  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:ts11, Tsc11.get_ts11!(id))}
  end

  def handle_event("delete", %{"id" => id}, socket) do
    ts11 = Tsc11.get_ts11!(id)
    {:ok, _} = Tsc11.delete_ts11(ts11)

    {:noreply, assign(socket, :ts11s, list_ts11s())}
  end

  defp list_ts11s do
    Tsc11.list_ts11s()
  end




  defp page_title(:show), do: "Show Ts11"
  defp page_title(:edit), do: "Edit Ts11"
end
