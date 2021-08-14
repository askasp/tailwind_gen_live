defmodule TailwindgenWeb.Post8LiveTest do
  use TailwindgenWeb.ConnCase

  import Phoenix.LiveViewTest

  alias Tailwindgen.Test8

  @create_attrs %{body: "some body", title: "some title"}
  @update_attrs %{body: "some updated body", title: "some updated title"}
  @invalid_attrs %{body: nil, title: nil}

  defp fixture(:post8) do
    {:ok, post8} = Test8.create_post8(@create_attrs)
    post8
  end

  defp create_post8(_) do
    post8 = fixture(:post8)
    %{post8: post8}
  end

  describe "Index" do
    setup [:create_post8]

    test "lists all post8s", %{conn: conn, post8: post8} do
      {:ok, _index_live, html} = live(conn, Routes.post8_index_path(conn, :index))

      assert html =~ "Listing Post8s"
      assert html =~ post8.body
    end

    test "saves new post8", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.post8_index_path(conn, :index))

      assert index_live |> element("a", "New Post8") |> render_click() =~
               "New Post8"

      assert_patch(index_live, Routes.post8_index_path(conn, :new))

      assert index_live
             |> form("#post8-form", post8: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#post8-form", post8: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.post8_index_path(conn, :index))

      assert html =~ "Post8 created successfully"
      assert html =~ "some body"
    end

    test "updates post8 in listing", %{conn: conn, post8: post8} do
      {:ok, index_live, _html} = live(conn, Routes.post8_index_path(conn, :index))

      assert index_live |> element("#post8-#{post8.id} a", "Edit") |> render_click() =~
               "Edit Post8"

      assert_patch(index_live, Routes.post8_index_path(conn, :edit, post8))

      assert index_live
             |> form("#post8-form", post8: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#post8-form", post8: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.post8_index_path(conn, :index))

      assert html =~ "Post8 updated successfully"
      assert html =~ "some updated body"
    end

    test "deletes post8 in listing", %{conn: conn, post8: post8} do
      {:ok, index_live, _html} = live(conn, Routes.post8_index_path(conn, :index))

      assert index_live |> element("#post8-#{post8.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#post8-#{post8.id}")
    end
  end

  describe "Show" do
    setup [:create_post8]

    test "displays post8", %{conn: conn, post8: post8} do
      {:ok, _show_live, html} = live(conn, Routes.post8_show_path(conn, :show, post8))

      assert html =~ "Show Post8"
      assert html =~ post8.body
    end

    test "updates post8 within modal", %{conn: conn, post8: post8} do
      {:ok, show_live, _html} = live(conn, Routes.post8_show_path(conn, :show, post8))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Post8"

      assert_patch(show_live, Routes.post8_show_path(conn, :edit, post8))

      assert show_live
             |> form("#post8-form", post8: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#post8-form", post8: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.post8_show_path(conn, :show, post8))

      assert html =~ "Post8 updated successfully"
      assert html =~ "some updated body"
    end
  end
end
