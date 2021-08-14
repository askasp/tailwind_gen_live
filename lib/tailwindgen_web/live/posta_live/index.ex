defmodule TailwindgenWeb.PostaLive.Index do
  use TailwindgenWeb, :live_view

  alias Tailwindgen.Tast
  alias Tailwindgen.Tast.Posta

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :postas, list_postas())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Posta")
    |> assign(:posta, Tast.get_posta!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Posta")
    |> assign(:posta, %Posta{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Postas")
    |> assign(:posta, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    posta = Tast.get_posta!(id)
    {:ok, _} = Tast.delete_posta(posta)

    {:noreply, assign(socket, :postas, list_postas())}
  end

  defp list_postas do
    Tast.list_postas()
  end
end
