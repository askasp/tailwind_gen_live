defmodule TailwindgenWeb.Post9Live.Show do
  use TailwindgenWeb, :live_view

  alias Tailwindgen.Test9

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:post9, Test9.get_post9!(id))}
  end


  defp page_title(:show), do: "Show Post9"
  defp page_title(:edit), do: "Edit Post9"
end
