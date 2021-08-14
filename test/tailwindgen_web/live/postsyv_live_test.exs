defmodule TailwindgenWeb.PostsyvLiveTest do
  use TailwindgenWeb.ConnCase

  import Phoenix.LiveViewTest

  alias Tailwindgen.Test7

  @create_attrs %{body: "some body", title: "some title"}
  @update_attrs %{body: "some updated body", title: "some updated title"}
  @invalid_attrs %{body: nil, title: nil}

  defp fixture(:postsyv) do
    {:ok, postsyv} = Test7.create_postsyv(@create_attrs)
    postsyv
  end

  defp create_postsyv(_) do
    postsyv = fixture(:postsyv)
    %{postsyv: postsyv}
  end

  describe "Index" do
    setup [:create_postsyv]

    test "lists all postsyvs", %{conn: conn, postsyv: postsyv} do
      {:ok, _index_live, html} = live(conn, Routes.postsyv_index_path(conn, :index))

      assert html =~ "Listing Postsyvs"
      assert html =~ postsyv.body
    end

    test "saves new postsyv", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.postsyv_index_path(conn, :index))

      assert index_live |> element("a", "New Postsyv") |> render_click() =~
               "New Postsyv"

      assert_patch(index_live, Routes.postsyv_index_path(conn, :new))

      assert index_live
             |> form("#postsyv-form", postsyv: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#postsyv-form", postsyv: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.postsyv_index_path(conn, :index))

      assert html =~ "Postsyv created successfully"
      assert html =~ "some body"
    end

    test "updates postsyv in listing", %{conn: conn, postsyv: postsyv} do
      {:ok, index_live, _html} = live(conn, Routes.postsyv_index_path(conn, :index))

      assert index_live |> element("#postsyv-#{postsyv.id} a", "Edit") |> render_click() =~
               "Edit Postsyv"

      assert_patch(index_live, Routes.postsyv_index_path(conn, :edit, postsyv))

      assert index_live
             |> form("#postsyv-form", postsyv: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#postsyv-form", postsyv: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.postsyv_index_path(conn, :index))

      assert html =~ "Postsyv updated successfully"
      assert html =~ "some updated body"
    end

    test "deletes postsyv in listing", %{conn: conn, postsyv: postsyv} do
      {:ok, index_live, _html} = live(conn, Routes.postsyv_index_path(conn, :index))

      assert index_live |> element("#postsyv-#{postsyv.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#postsyv-#{postsyv.id}")
    end
  end

  describe "Show" do
    setup [:create_postsyv]

    test "displays postsyv", %{conn: conn, postsyv: postsyv} do
      {:ok, _show_live, html} = live(conn, Routes.postsyv_show_path(conn, :show, postsyv))

      assert html =~ "Show Postsyv"
      assert html =~ postsyv.body
    end

    test "updates postsyv within modal", %{conn: conn, postsyv: postsyv} do
      {:ok, show_live, _html} = live(conn, Routes.postsyv_show_path(conn, :show, postsyv))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Postsyv"

      assert_patch(show_live, Routes.postsyv_show_path(conn, :edit, postsyv))

      assert show_live
             |> form("#postsyv-form", postsyv: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#postsyv-form", postsyv: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.postsyv_show_path(conn, :show, postsyv))

      assert html =~ "Postsyv updated successfully"
      assert html =~ "some updated body"
    end
  end
end
