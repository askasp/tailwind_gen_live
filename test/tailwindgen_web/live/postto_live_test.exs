defmodule TailwindgenWeb.PosttoLiveTest do
  use TailwindgenWeb.ConnCase

  import Phoenix.LiveViewTest

  alias Tailwindgen.Test2

  @create_attrs %{body: "some body", title: "some title"}
  @update_attrs %{body: "some updated body", title: "some updated title"}
  @invalid_attrs %{body: nil, title: nil}

  defp fixture(:postto) do
    {:ok, postto} = Test2.create_postto(@create_attrs)
    postto
  end

  defp create_postto(_) do
    postto = fixture(:postto)
    %{postto: postto}
  end

  describe "Index" do
    setup [:create_postto]

    test "lists all poststo", %{conn: conn, postto: postto} do
      {:ok, _index_live, html} = live(conn, Routes.postto_index_path(conn, :index))

      assert html =~ "Listing Poststo"
      assert html =~ postto.body
    end

    test "saves new postto", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.postto_index_path(conn, :index))

      assert index_live |> element("a", "New Postto") |> render_click() =~
               "New Postto"

      assert_patch(index_live, Routes.postto_index_path(conn, :new))

      assert index_live
             |> form("#postto-form", postto: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#postto-form", postto: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.postto_index_path(conn, :index))

      assert html =~ "Postto created successfully"
      assert html =~ "some body"
    end

    test "updates postto in listing", %{conn: conn, postto: postto} do
      {:ok, index_live, _html} = live(conn, Routes.postto_index_path(conn, :index))

      assert index_live |> element("#postto-#{postto.id} a", "Edit") |> render_click() =~
               "Edit Postto"

      assert_patch(index_live, Routes.postto_index_path(conn, :edit, postto))

      assert index_live
             |> form("#postto-form", postto: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#postto-form", postto: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.postto_index_path(conn, :index))

      assert html =~ "Postto updated successfully"
      assert html =~ "some updated body"
    end

    test "deletes postto in listing", %{conn: conn, postto: postto} do
      {:ok, index_live, _html} = live(conn, Routes.postto_index_path(conn, :index))

      assert index_live |> element("#postto-#{postto.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#postto-#{postto.id}")
    end
  end

  describe "Show" do
    setup [:create_postto]

    test "displays postto", %{conn: conn, postto: postto} do
      {:ok, _show_live, html} = live(conn, Routes.postto_show_path(conn, :show, postto))

      assert html =~ "Show Postto"
      assert html =~ postto.body
    end

    test "updates postto within modal", %{conn: conn, postto: postto} do
      {:ok, show_live, _html} = live(conn, Routes.postto_show_path(conn, :show, postto))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Postto"

      assert_patch(show_live, Routes.postto_show_path(conn, :edit, postto))

      assert show_live
             |> form("#postto-form", postto: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#postto-form", postto: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.postto_show_path(conn, :show, postto))

      assert html =~ "Postto updated successfully"
      assert html =~ "some updated body"
    end
  end
end
