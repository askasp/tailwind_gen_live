defmodule TailwindgenWeb.PostxLive.Show do
  use TailwindgenWeb, :live_view

  alias Tailwindgen.Tcst

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end


  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:postx, Tcst.get_postx!(id))}
  end

  def handle_event("delete", %{"id" => id}, socket) do
    postx = Tcst.get_postx!(id)
    {:ok, _} = Tcst.delete_postx(postx)

    {:noreply, assign(socket, :postvsxtitle, list_postvsxtitle())}
  end

  defp list_postvsxtitle do
    Tcst.list_postvsxtitle()
  end




  defp page_title(:show), do: "Show Postx"
  defp page_title(:edit), do: "Edit Postx"
end
