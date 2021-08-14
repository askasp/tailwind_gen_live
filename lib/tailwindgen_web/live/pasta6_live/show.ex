defmodule TailwindgenWeb.Pasta6Live.Show do
  use TailwindgenWeb, :live_view

  alias Tailwindgen.Tcsat6

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end


  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:pasta6, Tcsat6.get_pasta6!(id))}
  end

  def handle_event("delete", %{"id" => id}, socket) do
    pasta6 = Tcsat6.get_pasta6!(id)
    {:ok, _} = Tcsat6.delete_pasta6(pasta6)

    {:noreply, assign(socket, :pasta6s, list_pasta6s())}
  end

  defp list_pasta6s do
    Tcsat6.list_pasta6s()
  end




  defp page_title(:show), do: "Show Pasta6"
  defp page_title(:edit), do: "Edit Pasta6"
end
