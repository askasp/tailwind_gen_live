defmodule TailwindgenWeb.PostfemLive.Index do
  use TailwindgenWeb, :live_view

  alias Tailwindgen.Test5
  alias Tailwindgen.Test5.Postfem

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :postfems, list_postfems())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Postfem")
    |> assign(:postfem, Test5.get_postfem!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Postfem")
    |> assign(:postfem, %Postfem{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Postfems")
    |> assign(:postfem, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    postfem = Test5.get_postfem!(id)
    {:ok, _} = Test5.delete_postfem(postfem)

    {:noreply, assign(socket, :postfems, list_postfems())}
  end

  defp list_postfems do
    Test5.list_postfems()
  end
end
