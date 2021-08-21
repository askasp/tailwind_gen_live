defmodule TailwindgenWeb.Ts13Live.Show do
  use TailwindgenWeb, :live_view

  alias Tailwindgen.Tsc13

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end


  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:ts13, Tsc13.get_ts13!(id))}
  end

  def handle_event("delete", %{"id" => id}, socket) do
    ts13 = Tsc13.get_ts13!(id)
    {:ok, _} = Tsc13.delete_ts13(ts13)

    {:noreply, assign(socket, :ts13s, list_ts13s())}
  end

  defp list_ts13s do
    Tsc13.list_ts13s()
  end




  defp page_title(:show), do: "Show Ts13"
  defp page_title(:edit), do: "Edit Ts13"
end
