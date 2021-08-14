defmodule TailwindgenWeb.Pasta2Live.Show do
  use TailwindgenWeb, :live_view

  alias Tailwindgen.Tcsat2

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end


  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:pasta2, Tcsat2.get_pasta2!(id))}
  end

  def handle_event("delete", %{"id" => id}, socket) do
    pasta2 = Tcsat2.get_pasta2!(id)
    {:ok, _} = Tcsat2.delete_pasta2(pasta2)

    {:noreply, assign(socket, :pasta2s, list_pasta2s())}
  end

  defp list_pasta2s do
    Tcsat2.list_pasta2s()
  end




  defp page_title(:show), do: "Show Pasta2"
  defp page_title(:edit), do: "Edit Pasta2"
end
