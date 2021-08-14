defmodule TailwindgenWeb.PostsyvLive.Index do
  use TailwindgenWeb, :live_view

  alias Tailwindgen.Test7
  alias Tailwindgen.Test7.Postsyv

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :postsyvs, list_postsyvs())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Postsyv")
    |> assign(:postsyv, Test7.get_postsyv!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Postsyv")
    |> assign(:postsyv, %Postsyv{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Postsyvs")
    |> assign(:postsyv, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    postsyv = Test7.get_postsyv!(id)
    {:ok, _} = Test7.delete_postsyv(postsyv)

    {:noreply, assign(socket, :postsyvs, list_postsyvs())}
  end

  defp list_postsyvs do
    Test7.list_postsyvs()
  end
end
