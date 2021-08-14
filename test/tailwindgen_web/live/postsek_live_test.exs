defmodule TailwindgenWeb.PostsekLiveTest do
  use TailwindgenWeb.ConnCase

  import Phoenix.LiveViewTest

  alias Tailwindgen.Test6

  @create_attrs %{body: "some body", title: "some title"}
  @update_attrs %{body: "some updated body", title: "some updated title"}
  @invalid_attrs %{body: nil, title: nil}

  defp fixture(:postsek) do
    {:ok, postsek} = Test6.create_postsek(@create_attrs)
    postsek
  end

  defp create_postsek(_) do
    postsek = fixture(:postsek)
    %{postsek: postsek}
  end

  describe "Index" do
    setup [:create_postsek]

    test "lists all postseks", %{conn: conn, postsek: postsek} do
      {:ok, _index_live, html} = live(conn, Routes.postsek_index_path(conn, :index))

      assert html =~ "Listing Postseks"
      assert html =~ postsek.body
    end

    test "saves new postsek", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.postsek_index_path(conn, :index))

      assert index_live |> element("a", "New Postsek") |> render_click() =~
               "New Postsek"

      assert_patch(index_live, Routes.postsek_index_path(conn, :new))

      assert index_live
             |> form("#postsek-form", postsek: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#postsek-form", postsek: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.postsek_index_path(conn, :index))

      assert html =~ "Postsek created successfully"
      assert html =~ "some body"
    end

    test "updates postsek in listing", %{conn: conn, postsek: postsek} do
      {:ok, index_live, _html} = live(conn, Routes.postsek_index_path(conn, :index))

      assert index_live |> element("#postsek-#{postsek.id} a", "Edit") |> render_click() =~
               "Edit Postsek"

      assert_patch(index_live, Routes.postsek_index_path(conn, :edit, postsek))

      assert index_live
             |> form("#postsek-form", postsek: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#postsek-form", postsek: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.postsek_index_path(conn, :index))

      assert html =~ "Postsek updated successfully"
      assert html =~ "some updated body"
    end

    test "deletes postsek in listing", %{conn: conn, postsek: postsek} do
      {:ok, index_live, _html} = live(conn, Routes.postsek_index_path(conn, :index))

      assert index_live |> element("#postsek-#{postsek.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#postsek-#{postsek.id}")
    end
  end

  describe "Show" do
    setup [:create_postsek]

    test "displays postsek", %{conn: conn, postsek: postsek} do
      {:ok, _show_live, html} = live(conn, Routes.postsek_show_path(conn, :show, postsek))

      assert html =~ "Show Postsek"
      assert html =~ postsek.body
    end

    test "updates postsek within modal", %{conn: conn, postsek: postsek} do
      {:ok, show_live, _html} = live(conn, Routes.postsek_show_path(conn, :show, postsek))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Postsek"

      assert_patch(show_live, Routes.postsek_show_path(conn, :edit, postsek))

      assert show_live
             |> form("#postsek-form", postsek: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#postsek-form", postsek: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.postsek_show_path(conn, :show, postsek))

      assert html =~ "Postsek updated successfully"
      assert html =~ "some updated body"
    end
  end
end
