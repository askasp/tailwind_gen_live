defmodule TailwindgenWeb.PostyLiveTest do
  use TailwindgenWeb.ConnCase

  import Phoenix.LiveViewTest

  alias Tailwindgen.Tyst

  @create_attrs %{body: "some body", title: "some title"}
  @update_attrs %{body: "some updated body", title: "some updated title"}
  @invalid_attrs %{body: nil, title: nil}

  defp fixture(:posty) do
    {:ok, posty} = Tyst.create_posty(@create_attrs)
    posty
  end

  defp create_posty(_) do
    posty = fixture(:posty)
    %{posty: posty}
  end

  describe "Index" do
    setup [:create_posty]

    test "lists all postys", %{conn: conn, posty: posty} do
      {:ok, _index_live, html} = live(conn, Routes.posty_index_path(conn, :index))

      assert html =~ "Listing Postys"
      assert html =~ posty.body
    end

    test "saves new posty", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.posty_index_path(conn, :index))

      assert index_live |> element("a", "New Posty") |> render_click() =~
               "New Posty"

      assert_patch(index_live, Routes.posty_index_path(conn, :new))

      assert index_live
             |> form("#posty-form", posty: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#posty-form", posty: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.posty_index_path(conn, :index))

      assert html =~ "Posty created successfully"
      assert html =~ "some body"
    end

    test "updates posty in listing", %{conn: conn, posty: posty} do
      {:ok, index_live, _html} = live(conn, Routes.posty_index_path(conn, :index))

      assert index_live |> element("#posty-#{posty.id} a", "Edit") |> render_click() =~
               "Edit Posty"

      assert_patch(index_live, Routes.posty_index_path(conn, :edit, posty))

      assert index_live
             |> form("#posty-form", posty: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#posty-form", posty: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.posty_index_path(conn, :index))

      assert html =~ "Posty updated successfully"
      assert html =~ "some updated body"
    end

    test "deletes posty in listing", %{conn: conn, posty: posty} do
      {:ok, index_live, _html} = live(conn, Routes.posty_index_path(conn, :index))

      assert index_live |> element("#posty-#{posty.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#posty-#{posty.id}")
    end
  end

  describe "Show" do
    setup [:create_posty]

    test "displays posty", %{conn: conn, posty: posty} do
      {:ok, _show_live, html} = live(conn, Routes.posty_show_path(conn, :show, posty))

      assert html =~ "Show Posty"
      assert html =~ posty.body
    end

    test "updates posty within modal", %{conn: conn, posty: posty} do
      {:ok, show_live, _html} = live(conn, Routes.posty_show_path(conn, :show, posty))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Posty"

      assert_patch(show_live, Routes.posty_show_path(conn, :edit, posty))

      assert show_live
             |> form("#posty-form", posty: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#posty-form", posty: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.posty_show_path(conn, :show, posty))

      assert html =~ "Posty updated successfully"
      assert html =~ "some updated body"
    end
  end
end
