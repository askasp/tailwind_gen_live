defmodule TailwindgenWeb.PostvLiveTest do
  use TailwindgenWeb.ConnCase

  import Phoenix.LiveViewTest

  alias Tailwindgen.Trst

  @create_attrs %{body: "some body", title: "some title"}
  @update_attrs %{body: "some updated body", title: "some updated title"}
  @invalid_attrs %{body: nil, title: nil}

  defp fixture(:postv) do
    {:ok, postv} = Trst.create_postv(@create_attrs)
    postv
  end

  defp create_postv(_) do
    postv = fixture(:postv)
    %{postv: postv}
  end

  describe "Index" do
    setup [:create_postv]

    test "lists all postvs", %{conn: conn, postv: postv} do
      {:ok, _index_live, html} = live(conn, Routes.postv_index_path(conn, :index))

      assert html =~ "Listing Postvs"
      assert html =~ postv.body
    end

    test "saves new postv", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.postv_index_path(conn, :index))

      assert index_live |> element("a", "New Postv") |> render_click() =~
               "New Postv"

      assert_patch(index_live, Routes.postv_index_path(conn, :new))

      assert index_live
             |> form("#postv-form", postv: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#postv-form", postv: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.postv_index_path(conn, :index))

      assert html =~ "Postv created successfully"
      assert html =~ "some body"
    end

    test "updates postv in listing", %{conn: conn, postv: postv} do
      {:ok, index_live, _html} = live(conn, Routes.postv_index_path(conn, :index))

      assert index_live |> element("#postv-#{postv.id} a", "Edit") |> render_click() =~
               "Edit Postv"

      assert_patch(index_live, Routes.postv_index_path(conn, :edit, postv))

      assert index_live
             |> form("#postv-form", postv: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#postv-form", postv: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.postv_index_path(conn, :index))

      assert html =~ "Postv updated successfully"
      assert html =~ "some updated body"
    end

    test "deletes postv in listing", %{conn: conn, postv: postv} do
      {:ok, index_live, _html} = live(conn, Routes.postv_index_path(conn, :index))

      assert index_live |> element("#postv-#{postv.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#postv-#{postv.id}")
    end
  end

  describe "Show" do
    setup [:create_postv]

    test "displays postv", %{conn: conn, postv: postv} do
      {:ok, _show_live, html} = live(conn, Routes.postv_show_path(conn, :show, postv))

      assert html =~ "Show Postv"
      assert html =~ postv.body
    end

    test "updates postv within modal", %{conn: conn, postv: postv} do
      {:ok, show_live, _html} = live(conn, Routes.postv_show_path(conn, :show, postv))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Postv"

      assert_patch(show_live, Routes.postv_show_path(conn, :edit, postv))

      assert show_live
             |> form("#postv-form", postv: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#postv-form", postv: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.postv_show_path(conn, :show, postv))

      assert html =~ "Postv updated successfully"
      assert html =~ "some updated body"
    end
  end
end
