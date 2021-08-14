defmodule TailwindgenWeb.PostsekLive.Index do
  use TailwindgenWeb, :live_view

  alias Tailwindgen.Test6
  alias Tailwindgen.Test6.Postsek

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :postseks, list_postseks())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Postsek")
    |> assign(:postsek, Test6.get_postsek!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Postsek")
    |> assign(:postsek, %Postsek{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Postseks")
    |> assign(:postsek, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    postsek = Test6.get_postsek!(id)
    {:ok, _} = Test6.delete_postsek(postsek)

    {:noreply, assign(socket, :postseks, list_postseks())}
  end

  defp list_postseks do
    Test6.list_postseks()
  end
end
