defmodule TailwindgenWeb.PostsekLive.Show do
  use TailwindgenWeb, :live_view

  alias Tailwindgen.Test6

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:postsek, Test6.get_postsek!(id))}
  end

  defp page_title(:show), do: "Show Postsek"
  defp page_title(:edit), do: "Edit Postsek"
end
