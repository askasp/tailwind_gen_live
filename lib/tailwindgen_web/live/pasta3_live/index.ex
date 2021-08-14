defmodule TailwindgenWeb.Pasta3Live.Index do
  use TailwindgenWeb, :live_view

  alias Tailwindgen.Tcsat3
  alias Tailwindgen.Tcsat3.Pasta3

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :pasta3s, list_pasta3s())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Pasta3")
    |> assign(:pasta3, Tcsat3.get_pasta3!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Pasta3")
    |> assign(:pasta3, %Pasta3{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Pasta3s")
    |> assign(:pasta3, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    pasta3 = Tcsat3.get_pasta3!(id)
    {:ok, _} = Tcsat3.delete_pasta3(pasta3)

    {:noreply, assign(socket, :pasta3s, list_pasta3s())}
  end

  defp list_pasta3s do
    Tcsat3.list_pasta3s()
  end
end
