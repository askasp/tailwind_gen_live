defmodule TailwindgenWeb.PostoLive.Show do
  use TailwindgenWeb, :live_view

  alias Tailwindgen.Tost

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end


  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:posto, Tost.get_posto!(id))}
  end

  def handle_event("delete", %{"id" => id}, socket) do
    posto = Tost.get_posto!(id)
    {:ok, _} = Tost.delete_posto(posto)

    {:noreply, assign(socket, :postos, list_postos())}
  end

  defp list_postos do
    Tost.list_postos()
  end




  defp page_title(:show), do: "Show Posto"
  defp page_title(:edit), do: "Edit Posto"
end
