defmodule TailwindgenWeb.Pasta7Live.Show do
  use TailwindgenWeb, :live_view

  alias Tailwindgen.Tcsat7

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end


  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:pasta7, Tcsat7.get_pasta7!(id))}
  end

  def handle_event("delete", %{"id" => id}, socket) do
    pasta7 = Tcsat7.get_pasta7!(id)
    {:ok, _} = Tcsat7.delete_pasta7(pasta7)

    {:noreply, assign(socket, :pasta7s, list_pasta7s())}
  end

  defp list_pasta7s do
    Tcsat7.list_pasta7s()
  end




  defp page_title(:show), do: "Show Pasta7"
  defp page_title(:edit), do: "Edit Pasta7"
end
