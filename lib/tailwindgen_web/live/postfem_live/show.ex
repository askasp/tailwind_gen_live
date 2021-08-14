defmodule TailwindgenWeb.PostfemLive.Show do
  use TailwindgenWeb, :live_view

  alias Tailwindgen.Test5

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:postfem, Test5.get_postfem!(id))}
  end

  defp page_title(:show), do: "Show Postfem"
  defp page_title(:edit), do: "Edit Postfem"
end
