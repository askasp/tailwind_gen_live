defmodule TailwindgenWeb.PosteLive.Index do
  use TailwindgenWeb, :live_view

  alias Tailwindgen.Tgst
  alias Tailwindgen.Tgst.Poste

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :postes, list_postes())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Poste")
    |> assign(:poste, Tgst.get_poste!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Poste")
    |> assign(:poste, %Poste{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Postes")
    |> assign(:poste, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    poste = Tgst.get_poste!(id)
    {:ok, _} = Tgst.delete_poste(poste)

    {:noreply, assign(socket, :postes, list_postes())}
  end

  defp list_postes do
    Tgst.list_postes()
  end
end
