defmodule TailwindgenWeb.PostaLiveTest do
  use TailwindgenWeb.ConnCase

  import Phoenix.LiveViewTest

  alias Tailwindgen.Tast

  @create_attrs %{body: "some body", title: "some title"}
  @update_attrs %{body: "some updated body", title: "some updated title"}
  @invalid_attrs %{body: nil, title: nil}

  defp fixture(:posta) do
    {:ok, posta} = Tast.create_posta(@create_attrs)
    posta
  end

  defp create_posta(_) do
    posta = fixture(:posta)
    %{posta: posta}
  end

  describe "Index" do
    setup [:create_posta]

    test "lists all postas", %{conn: conn, posta: posta} do
      {:ok, _index_live, html} = live(conn, Routes.posta_index_path(conn, :index))

      assert html =~ "Listing Postas"
      assert html =~ posta.body
    end

    test "saves new posta", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.posta_index_path(conn, :index))

      assert index_live |> element("a", "New Posta") |> render_click() =~
               "New Posta"

      assert_patch(index_live, Routes.posta_index_path(conn, :new))

      assert index_live
             |> form("#posta-form", posta: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#posta-form", posta: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.posta_index_path(conn, :index))

      assert html =~ "Posta created successfully"
      assert html =~ "some body"
    end

    test "updates posta in listing", %{conn: conn, posta: posta} do
      {:ok, index_live, _html} = live(conn, Routes.posta_index_path(conn, :index))

      assert index_live |> element("#posta-#{posta.id} a", "Edit") |> render_click() =~
               "Edit Posta"

      assert_patch(index_live, Routes.posta_index_path(conn, :edit, posta))

      assert index_live
             |> form("#posta-form", posta: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#posta-form", posta: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.posta_index_path(conn, :index))

      assert html =~ "Posta updated successfully"
      assert html =~ "some updated body"
    end

    test "deletes posta in listing", %{conn: conn, posta: posta} do
      {:ok, index_live, _html} = live(conn, Routes.posta_index_path(conn, :index))

      assert index_live |> element("#posta-#{posta.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#posta-#{posta.id}")
    end
  end

  describe "Show" do
    setup [:create_posta]

    test "displays posta", %{conn: conn, posta: posta} do
      {:ok, _show_live, html} = live(conn, Routes.posta_show_path(conn, :show, posta))

      assert html =~ "Show Posta"
      assert html =~ posta.body
    end

    test "updates posta within modal", %{conn: conn, posta: posta} do
      {:ok, show_live, _html} = live(conn, Routes.posta_show_path(conn, :show, posta))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Posta"

      assert_patch(show_live, Routes.posta_show_path(conn, :edit, posta))

      assert show_live
             |> form("#posta-form", posta: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#posta-form", posta: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.posta_show_path(conn, :show, posta))

      assert html =~ "Posta updated successfully"
      assert html =~ "some updated body"
    end
  end
end
