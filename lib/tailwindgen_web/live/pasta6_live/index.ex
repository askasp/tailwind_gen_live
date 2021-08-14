defmodule TailwindgenWeb.Pasta6Live.Index do
  use TailwindgenWeb, :live_view

  alias Tailwindgen.Tcsat6
  alias Tailwindgen.Tcsat6.Pasta6

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :pasta6s, list_pasta6s())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Pasta6")
    |> assign(:pasta6, Tcsat6.get_pasta6!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Pasta6")
    |> assign(:pasta6, %Pasta6{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Pasta6s")
    |> assign(:pasta6, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    pasta6 = Tcsat6.get_pasta6!(id)
    {:ok, _} = Tcsat6.delete_pasta6(pasta6)

    {:noreply, assign(socket, :pasta6s, list_pasta6s())}
  end

  defp list_pasta6s do
    Tcsat6.list_pasta6s()
  end
end
