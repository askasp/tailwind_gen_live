defmodule TailwindgenWeb.Pasta3Live.Show do
  use TailwindgenWeb, :live_view

  alias Tailwindgen.Tcsat3

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end


  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:pasta3, Tcsat3.get_pasta3!(id))}
  end

  def handle_event("delete", %{"id" => id}, socket) do
    pasta3 = Tcsat3.get_pasta3!(id)
    {:ok, _} = Tcsat3.delete_pasta3(pasta3)

    {:noreply, assign(socket, :pasta3s, list_pasta3s())}
  end

  defp list_pasta3s do
    Tcsat3.list_pasta3s()
  end




  defp page_title(:show), do: "Show Pasta3"
  defp page_title(:edit), do: "Edit Pasta3"
end
