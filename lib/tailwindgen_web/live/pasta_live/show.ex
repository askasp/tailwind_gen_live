defmodule TailwindgenWeb.PastaLive.Show do
  use TailwindgenWeb, :live_view

  alias Tailwindgen.Tcsat

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end


  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:pasta, Tcsat.get_pasta!(id))}
  end

  def handle_event("delete", %{"id" => id}, socket) do
    pasta = Tcsat.get_pasta!(id)
    {:ok, _} = Tcsat.delete_pasta(pasta)

    {:noreply, assign(socket, :pastas, list_pastas())}
  end

  defp list_pastas do
    Tcsat.list_pastas()
  end




  defp page_title(:show), do: "Show Pasta"
  defp page_title(:edit), do: "Edit Pasta"
end
