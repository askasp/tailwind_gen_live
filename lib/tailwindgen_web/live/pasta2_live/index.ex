defmodule TailwindgenWeb.Pasta2Live.Index do
  use TailwindgenWeb, :live_view

  alias Tailwindgen.Tcsat2
  alias Tailwindgen.Tcsat2.Pasta2

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :pasta2s, list_pasta2s())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Pasta2")
    |> assign(:pasta2, Tcsat2.get_pasta2!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Pasta2")
    |> assign(:pasta2, %Pasta2{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Pasta2s")
    |> assign(:pasta2, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    pasta2 = Tcsat2.get_pasta2!(id)
    {:ok, _} = Tcsat2.delete_pasta2(pasta2)

    {:noreply, assign(socket, :pasta2s, list_pasta2s())}
  end

  defp list_pasta2s do
    Tcsat2.list_pasta2s()
  end
end
