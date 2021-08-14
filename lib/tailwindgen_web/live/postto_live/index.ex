defmodule TailwindgenWeb.PosttoLive.Index do
  use TailwindgenWeb, :live_view

  alias Tailwindgen.Test2
  alias Tailwindgen.Test2.Postto

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :poststo, list_poststo())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Postto")
    |> assign(:postto, Test2.get_postto!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Postto")
    |> assign(:postto, %Postto{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Poststo")
    |> assign(:postto, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    postto = Test2.get_postto!(id)
    {:ok, _} = Test2.delete_postto(postto)

    {:noreply, assign(socket, :poststo, list_poststo())}
  end

  defp list_poststo do
    Test2.list_poststo()
  end
end
