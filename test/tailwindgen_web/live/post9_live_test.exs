defmodule TailwindgenWeb.Post9LiveTest do
  use TailwindgenWeb.ConnCase

  import Phoenix.LiveViewTest

  alias Tailwindgen.Test9

  @create_attrs %{body: "some body", title: "some title"}
  @update_attrs %{body: "some updated body", title: "some updated title"}
  @invalid_attrs %{body: nil, title: nil}

  defp fixture(:post9) do
    {:ok, post9} = Test9.create_post9(@create_attrs)
    post9
  end

  defp create_post9(_) do
    post9 = fixture(:post9)
    %{post9: post9}
  end

  describe "Index" do
    setup [:create_post9]

    test "lists all post9s", %{conn: conn, post9: post9} do
      {:ok, _index_live, html} = live(conn, Routes.post9_index_path(conn, :index))

      assert html =~ "Listing Post9s"
      assert html =~ post9.body
    end

    test "saves new post9", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.post9_index_path(conn, :index))

      assert index_live |> element("a", "New Post9") |> render_click() =~
               "New Post9"

      assert_patch(index_live, Routes.post9_index_path(conn, :new))

      assert index_live
             |> form("#post9-form", post9: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#post9-form", post9: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.post9_index_path(conn, :index))

      assert html =~ "Post9 created successfully"
      assert html =~ "some body"
    end

    test "updates post9 in listing", %{conn: conn, post9: post9} do
      {:ok, index_live, _html} = live(conn, Routes.post9_index_path(conn, :index))

      assert index_live |> element("#post9-#{post9.id} a", "Edit") |> render_click() =~
               "Edit Post9"

      assert_patch(index_live, Routes.post9_index_path(conn, :edit, post9))

      assert index_live
             |> form("#post9-form", post9: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#post9-form", post9: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.post9_index_path(conn, :index))

      assert html =~ "Post9 updated successfully"
      assert html =~ "some updated body"
    end

    test "deletes post9 in listing", %{conn: conn, post9: post9} do
      {:ok, index_live, _html} = live(conn, Routes.post9_index_path(conn, :index))

      assert index_live |> element("#post9-#{post9.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#post9-#{post9.id}")
    end
  end

  describe "Show" do
    setup [:create_post9]

    test "displays post9", %{conn: conn, post9: post9} do
      {:ok, _show_live, html} = live(conn, Routes.post9_show_path(conn, :show, post9))

      assert html =~ "Show Post9"
      assert html =~ post9.body
    end

    test "updates post9 within modal", %{conn: conn, post9: post9} do
      {:ok, show_live, _html} = live(conn, Routes.post9_show_path(conn, :show, post9))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Post9"

      assert_patch(show_live, Routes.post9_show_path(conn, :edit, post9))

      assert show_live
             |> form("#post9-form", post9: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#post9-form", post9: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.post9_show_path(conn, :show, post9))

      assert html =~ "Post9 updated successfully"
      assert html =~ "some updated body"
    end
  end
end
