defmodule TailwindgenWeb.PostxLiveTest do
  use TailwindgenWeb.ConnCase

  import Phoenix.LiveViewTest

  alias Tailwindgen.Tcst

  @create_attrs %{body: "some body"}
  @update_attrs %{body: "some updated body"}
  @invalid_attrs %{body: nil}

  defp fixture(:postx) do
    {:ok, postx} = Tcst.create_postx(@create_attrs)
    postx
  end

  defp create_postx(_) do
    postx = fixture(:postx)
    %{postx: postx}
  end

  describe "Index" do
    setup [:create_postx]

    test "lists all postvsxtitle", %{conn: conn, postx: postx} do
      {:ok, _index_live, html} = live(conn, Routes.postx_index_path(conn, :index))

      assert html =~ "Listing Postvsxtitle"
      assert html =~ postx.body
    end

    test "saves new postx", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.postx_index_path(conn, :index))

      assert index_live |> element("a", "New Postx") |> render_click() =~
               "New Postx"

      assert_patch(index_live, Routes.postx_index_path(conn, :new))

      assert index_live
             |> form("#postx-form", postx: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#postx-form", postx: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.postx_index_path(conn, :index))

      assert html =~ "Postx created successfully"
      assert html =~ "some body"
    end

    test "updates postx in listing", %{conn: conn, postx: postx} do
      {:ok, index_live, _html} = live(conn, Routes.postx_index_path(conn, :index))

      assert index_live |> element("#postx-#{postx.id} a", "Edit") |> render_click() =~
               "Edit Postx"

      assert_patch(index_live, Routes.postx_index_path(conn, :edit, postx))

      assert index_live
             |> form("#postx-form", postx: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#postx-form", postx: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.postx_index_path(conn, :index))

      assert html =~ "Postx updated successfully"
      assert html =~ "some updated body"
    end

    test "deletes postx in listing", %{conn: conn, postx: postx} do
      {:ok, index_live, _html} = live(conn, Routes.postx_index_path(conn, :index))

      assert index_live |> element("#postx-#{postx.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#postx-#{postx.id}")
    end
  end

  describe "Show" do
    setup [:create_postx]

    test "displays postx", %{conn: conn, postx: postx} do
      {:ok, _show_live, html} = live(conn, Routes.postx_show_path(conn, :show, postx))

      assert html =~ "Show Postx"
      assert html =~ postx.body
    end

    test "updates postx within modal", %{conn: conn, postx: postx} do
      {:ok, show_live, _html} = live(conn, Routes.postx_show_path(conn, :show, postx))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Postx"

      assert_patch(show_live, Routes.postx_show_path(conn, :edit, postx))

      assert show_live
             |> form("#postx-form", postx: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#postx-form", postx: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.postx_show_path(conn, :show, postx))

      assert html =~ "Postx updated successfully"
      assert html =~ "some updated body"
    end
  end
end
