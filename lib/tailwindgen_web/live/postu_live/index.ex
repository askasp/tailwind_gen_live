defmodule TailwindgenWeb.PostuLive.Index do
  use TailwindgenWeb, :live_view

  alias Tailwindgen.Tust
  alias Tailwindgen.Tust.Postu

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :postus, list_postus())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Postu")
    |> assign(:postu, Tust.get_postu!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Postu")
    |> assign(:postu, %Postu{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Postus")
    |> assign(:postu, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    postu = Tust.get_postu!(id)
    {:ok, _} = Tust.delete_postu(postu)

    {:noreply, assign(socket, :postus, list_postus())}
  end

  defp list_postus do
    Tust.list_postus()
  end
end
