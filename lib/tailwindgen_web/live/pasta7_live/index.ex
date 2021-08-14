defmodule TailwindgenWeb.Pasta7Live.Index do
  use TailwindgenWeb, :live_view

  alias Tailwindgen.Tcsat7
  alias Tailwindgen.Tcsat7.Pasta7

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :pasta7s, list_pasta7s())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Pasta7")
    |> assign(:pasta7, Tcsat7.get_pasta7!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Pasta7")
    |> assign(:pasta7, %Pasta7{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Pasta7s")
    |> assign(:pasta7, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    pasta7 = Tcsat7.get_pasta7!(id)
    {:ok, _} = Tcsat7.delete_pasta7(pasta7)

    {:noreply, assign(socket, :pasta7s, list_pasta7s())}
  end

  defp list_pasta7s do
    Tcsat7.list_pasta7s()
  end
end
