defmodule TailwindgenWeb.Post9Live.Index do
  use TailwindgenWeb, :live_view

  alias Tailwindgen.Test9
  alias Tailwindgen.Test9.Post9

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :post9s, list_post9s())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Post9")
    |> assign(:post9, Test9.get_post9!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Post9")
    |> assign(:post9, %Post9{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Post9s")
    |> assign(:post9, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    post9 = Test9.get_post9!(id)
    {:ok, _} = Test9.delete_post9(post9)

    {:noreply, assign(socket, :post9s, list_post9s())}
  end

  defp list_post9s do
    Test9.list_post9s()
  end
end
