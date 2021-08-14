defmodule TailwindgenWeb.Pasta5Live.Show do
  use TailwindgenWeb, :live_view

  alias Tailwindgen.Tcsat5

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end


  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:pasta5, Tcsat5.get_pasta5!(id))}
  end

  def handle_event("delete", %{"id" => id}, socket) do
    pasta5 = Tcsat5.get_pasta5!(id)
    {:ok, _} = Tcsat5.delete_pasta5(pasta5)

    {:noreply, assign(socket, :pasta5s, list_pasta5s())}
  end

  defp list_pasta5s do
    Tcsat5.list_pasta5s()
  end




  defp page_title(:show), do: "Show Pasta5"
  defp page_title(:edit), do: "Edit Pasta5"
end
