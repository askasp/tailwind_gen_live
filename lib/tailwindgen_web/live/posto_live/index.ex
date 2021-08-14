defmodule TailwindgenWeb.PostoLive.Index do
  use TailwindgenWeb, :live_view

  alias Tailwindgen.Tost
  alias Tailwindgen.Tost.Posto

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :postos, list_postos())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Posto")
    |> assign(:posto, Tost.get_posto!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Posto")
    |> assign(:posto, %Posto{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Postos")
    |> assign(:posto, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    posto = Tost.get_posto!(id)
    {:ok, _} = Tost.delete_posto(posto)

    {:noreply, assign(socket, :postos, list_postos())}
  end

  defp list_postos do
    Tost.list_postos()
  end
end
