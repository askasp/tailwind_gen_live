defmodule TailwindgenWeb.Pasta5Live.Index do
  use TailwindgenWeb, :live_view

  alias Tailwindgen.Tcsat5
  alias Tailwindgen.Tcsat5.Pasta5

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :pasta5s, list_pasta5s())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Pasta5")
    |> assign(:pasta5, Tcsat5.get_pasta5!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Pasta5")
    |> assign(:pasta5, %Pasta5{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Pasta5s")
    |> assign(:pasta5, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    pasta5 = Tcsat5.get_pasta5!(id)
    {:ok, _} = Tcsat5.delete_pasta5(pasta5)

    {:noreply, assign(socket, :pasta5s, list_pasta5s())}
  end

  defp list_pasta5s do
    Tcsat5.list_pasta5s()
  end
end
