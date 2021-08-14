defmodule TailwindgenWeb.PostxLive.Index do
  use TailwindgenWeb, :live_view

  alias Tailwindgen.Tcst
  alias Tailwindgen.Tcst.Postx

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :postvsxtitle, list_postvsxtitle())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Postx")
    |> assign(:postx, Tcst.get_postx!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Postx")
    |> assign(:postx, %Postx{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Postvsxtitle")
    |> assign(:postx, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    postx = Tcst.get_postx!(id)
    {:ok, _} = Tcst.delete_postx(postx)

    {:noreply, assign(socket, :postvsxtitle, list_postvsxtitle())}
  end

  defp list_postvsxtitle do
    Tcst.list_postvsxtitle()
  end
end
