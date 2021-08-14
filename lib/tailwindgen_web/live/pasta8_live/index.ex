defmodule TailwindgenWeb.Pasta8Live.Index do
  use TailwindgenWeb, :live_view

  alias Tailwindgen.Tcsat8
  alias Tailwindgen.Tcsat8.Pasta8

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :pasta8s, list_pasta8s())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Pasta8")
    |> assign(:pasta8, Tcsat8.get_pasta8!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Pasta8")
    |> assign(:pasta8, %Pasta8{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Pasta8s")
    |> assign(:pasta8, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    pasta8 = Tcsat8.get_pasta8!(id)
    {:ok, _} = Tcsat8.delete_pasta8(pasta8)

    {:noreply, assign(socket, :pasta8s, list_pasta8s())}
  end

  defp list_pasta8s do
    Tcsat8.list_pasta8s()
  end
end
