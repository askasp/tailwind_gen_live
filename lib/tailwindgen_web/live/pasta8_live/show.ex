defmodule TailwindgenWeb.Pasta8Live.Show do
  use TailwindgenWeb, :live_view

  alias Tailwindgen.Tcsat8

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end


  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:pasta8, Tcsat8.get_pasta8!(id))}
  end

  def handle_event("delete", %{"id" => id}, socket) do
    pasta8 = Tcsat8.get_pasta8!(id)
    {:ok, _} = Tcsat8.delete_pasta8(pasta8)

    {:noreply, assign(socket, :pasta8s, list_pasta8s())}
  end

  defp list_pasta8s do
    Tcsat8.list_pasta8s()
  end




  defp page_title(:show), do: "Show Pasta8"
  defp page_title(:edit), do: "Edit Pasta8"
end
