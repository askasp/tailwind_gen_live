defmodule TailwindgenWeb.PostuLive.Show do
  use TailwindgenWeb, :live_view

  alias Tailwindgen.Tust

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:postu, Tust.get_postu!(id))}
  end

  defp page_title(:show), do: "Show Postu"
  defp page_title(:edit), do: "Edit Postu"
end
