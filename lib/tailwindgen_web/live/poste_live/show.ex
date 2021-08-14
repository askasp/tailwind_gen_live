defmodule TailwindgenWeb.PosteLive.Show do
  use TailwindgenWeb, :live_view

  alias Tailwindgen.Tgst

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end


  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:poste, Tgst.get_poste!(id))}
  end

  def handle_event("delete", %{"id" => id}, socket) do
    poste = Tgst.get_poste!(id)
    {:ok, _} = Tgst.delete_poste(poste)

    {:noreply, assign(socket, :postes, list_postes())}
  end

  defp list_postes do
    Tgst.list_postes()
  end




  defp page_title(:show), do: "Show Poste"
  defp page_title(:edit), do: "Edit Poste"
end
