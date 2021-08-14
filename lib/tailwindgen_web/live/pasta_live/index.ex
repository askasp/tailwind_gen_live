defmodule TailwindgenWeb.PastaLive.Index do
  use TailwindgenWeb, :live_view

  alias Tailwindgen.Tcsat
  alias Tailwindgen.Tcsat.Pasta

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :pastas, list_pastas())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Pasta")
    |> assign(:pasta, Tcsat.get_pasta!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Pasta")
    |> assign(:pasta, %Pasta{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Pastas")
    |> assign(:pasta, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    pasta = Tcsat.get_pasta!(id)
    {:ok, _} = Tcsat.delete_pasta(pasta)

    {:noreply, assign(socket, :pastas, list_pastas())}
  end

  defp list_pastas do
    Tcsat.list_pastas()
  end
end
