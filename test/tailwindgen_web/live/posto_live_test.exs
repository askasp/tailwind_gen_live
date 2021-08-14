defmodule TailwindgenWeb.PostoLiveTest do
  use TailwindgenWeb.ConnCase

  import Phoenix.LiveViewTest

  alias Tailwindgen.Tost

  @create_attrs %{body: "some body", title: "some title"}
  @update_attrs %{body: "some updated body", title: "some updated title"}
  @invalid_attrs %{body: nil, title: nil}

  defp fixture(:posto) do
    {:ok, posto} = Tost.create_posto(@create_attrs)
    posto
  end

  defp create_posto(_) do
    posto = fixture(:posto)
    %{posto: posto}
  end

  describe "Index" do
    setup [:create_posto]

    test "lists all postos", %{conn: conn, posto: posto} do
      {:ok, _index_live, html} = live(conn, Routes.posto_index_path(conn, :index))

      assert html =~ "Listing Postos"
      assert html =~ posto.body
    end

    test "saves new posto", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.posto_index_path(conn, :index))

      assert index_live |> element("a", "New Posto") |> render_click() =~
               "New Posto"

      assert_patch(index_live, Routes.posto_index_path(conn, :new))

      assert index_live
             |> form("#posto-form", posto: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#posto-form", posto: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.posto_index_path(conn, :index))

      assert html =~ "Posto created successfully"
      assert html =~ "some body"
    end

    test "updates posto in listing", %{conn: conn, posto: posto} do
      {:ok, index_live, _html} = live(conn, Routes.posto_index_path(conn, :index))

      assert index_live |> element("#posto-#{posto.id} a", "Edit") |> render_click() =~
               "Edit Posto"

      assert_patch(index_live, Routes.posto_index_path(conn, :edit, posto))

      assert index_live
             |> form("#posto-form", posto: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#posto-form", posto: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.posto_index_path(conn, :index))

      assert html =~ "Posto updated successfully"
      assert html =~ "some updated body"
    end

    test "deletes posto in listing", %{conn: conn, posto: posto} do
      {:ok, index_live, _html} = live(conn, Routes.posto_index_path(conn, :index))

      assert index_live |> element("#posto-#{posto.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#posto-#{posto.id}")
    end
  end

  describe "Show" do
    setup [:create_posto]

    test "displays posto", %{conn: conn, posto: posto} do
      {:ok, _show_live, html} = live(conn, Routes.posto_show_path(conn, :show, posto))

      assert html =~ "Show Posto"
      assert html =~ posto.body
    end

    test "updates posto within modal", %{conn: conn, posto: posto} do
      {:ok, show_live, _html} = live(conn, Routes.posto_show_path(conn, :show, posto))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Posto"

      assert_patch(show_live, Routes.posto_show_path(conn, :edit, posto))

      assert show_live
             |> form("#posto-form", posto: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#posto-form", posto: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.posto_show_path(conn, :show, posto))

      assert html =~ "Posto updated successfully"
      assert html =~ "some updated body"
    end
  end
end
