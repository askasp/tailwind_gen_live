defmodule TailwindgenWeb.PostiLiveTest do
  use TailwindgenWeb.ConnCase

  import Phoenix.LiveViewTest

  alias Tailwindgen.Tist

  @create_attrs %{body: "some body", title: "some title"}
  @update_attrs %{body: "some updated body", title: "some updated title"}
  @invalid_attrs %{body: nil, title: nil}

  defp fixture(:posti) do
    {:ok, posti} = Tist.create_posti(@create_attrs)
    posti
  end

  defp create_posti(_) do
    posti = fixture(:posti)
    %{posti: posti}
  end

  describe "Index" do
    setup [:create_posti]

    test "lists all postis", %{conn: conn, posti: posti} do
      {:ok, _index_live, html} = live(conn, Routes.posti_index_path(conn, :index))

      assert html =~ "Listing Postis"
      assert html =~ posti.body
    end

    test "saves new posti", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.posti_index_path(conn, :index))

      assert index_live |> element("a", "New Posti") |> render_click() =~
               "New Posti"

      assert_patch(index_live, Routes.posti_index_path(conn, :new))

      assert index_live
             |> form("#posti-form", posti: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#posti-form", posti: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.posti_index_path(conn, :index))

      assert html =~ "Posti created successfully"
      assert html =~ "some body"
    end

    test "updates posti in listing", %{conn: conn, posti: posti} do
      {:ok, index_live, _html} = live(conn, Routes.posti_index_path(conn, :index))

      assert index_live |> element("#posti-#{posti.id} a", "Edit") |> render_click() =~
               "Edit Posti"

      assert_patch(index_live, Routes.posti_index_path(conn, :edit, posti))

      assert index_live
             |> form("#posti-form", posti: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#posti-form", posti: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.posti_index_path(conn, :index))

      assert html =~ "Posti updated successfully"
      assert html =~ "some updated body"
    end

    test "deletes posti in listing", %{conn: conn, posti: posti} do
      {:ok, index_live, _html} = live(conn, Routes.posti_index_path(conn, :index))

      assert index_live |> element("#posti-#{posti.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#posti-#{posti.id}")
    end
  end

  describe "Show" do
    setup [:create_posti]

    test "displays posti", %{conn: conn, posti: posti} do
      {:ok, _show_live, html} = live(conn, Routes.posti_show_path(conn, :show, posti))

      assert html =~ "Show Posti"
      assert html =~ posti.body
    end

    test "updates posti within modal", %{conn: conn, posti: posti} do
      {:ok, show_live, _html} = live(conn, Routes.posti_show_path(conn, :show, posti))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Posti"

      assert_patch(show_live, Routes.posti_show_path(conn, :edit, posti))

      assert show_live
             |> form("#posti-form", posti: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#posti-form", posti: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.posti_show_path(conn, :show, posti))

      assert html =~ "Posti updated successfully"
      assert html =~ "some updated body"
    end
  end
end
