defmodule TailwindgenWeb.PostsyvLive.Show do
  use TailwindgenWeb, :live_view

  alias Tailwindgen.Test7

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:postsyv, Test7.get_postsyv!(id))}
  end


  defp page_title(:show), do: "Show Postsyv"
  defp page_title(:edit), do: "Edit Postsyv"
end
