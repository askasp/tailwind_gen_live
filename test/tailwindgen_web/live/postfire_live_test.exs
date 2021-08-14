defmodule TailwindgenWeb.PostfireLiveTest do
  use TailwindgenWeb.ConnCase

  import Phoenix.LiveViewTest

  alias Tailwindgen.Test4

  @create_attrs %{body: "some body", title: "some title"}
  @update_attrs %{body: "some updated body", title: "some updated title"}
  @invalid_attrs %{body: nil, title: nil}

  defp fixture(:postfire) do
    {:ok, postfire} = Test4.create_postfire(@create_attrs)
    postfire
  end

  defp create_postfire(_) do
    postfire = fixture(:postfire)
    %{postfire: postfire}
  end

  describe "Index" do
    setup [:create_postfire]

    test "lists all postfire", %{conn: conn, postfire: postfire} do
      {:ok, _index_live, html} = live(conn, Routes.postfire_index_path(conn, :index))

      assert html =~ "Listing Postfire"
      assert html =~ postfire.body
    end

    test "saves new postfire", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.postfire_index_path(conn, :index))

      assert index_live |> element("a", "New Postfire") |> render_click() =~
               "New Postfire"

      assert_patch(index_live, Routes.postfire_index_path(conn, :new))

      assert index_live
             |> form("#postfire-form", postfire: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#postfire-form", postfire: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.postfire_index_path(conn, :index))

      assert html =~ "Postfire created successfully"
      assert html =~ "some body"
    end

    test "updates postfire in listing", %{conn: conn, postfire: postfire} do
      {:ok, index_live, _html} = live(conn, Routes.postfire_index_path(conn, :index))

      assert index_live |> element("#postfire-#{postfire.id} a", "Edit") |> render_click() =~
               "Edit Postfire"

      assert_patch(index_live, Routes.postfire_index_path(conn, :edit, postfire))

      assert index_live
             |> form("#postfire-form", postfire: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#postfire-form", postfire: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.postfire_index_path(conn, :index))

      assert html =~ "Postfire updated successfully"
      assert html =~ "some updated body"
    end

    test "deletes postfire in listing", %{conn: conn, postfire: postfire} do
      {:ok, index_live, _html} = live(conn, Routes.postfire_index_path(conn, :index))

      assert index_live |> element("#postfire-#{postfire.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#postfire-#{postfire.id}")
    end
  end

  describe "Show" do
    setup [:create_postfire]

    test "displays postfire", %{conn: conn, postfire: postfire} do
      {:ok, _show_live, html} = live(conn, Routes.postfire_show_path(conn, :show, postfire))

      assert html =~ "Show Postfire"
      assert html =~ postfire.body
    end

    test "updates postfire within modal", %{conn: conn, postfire: postfire} do
      {:ok, show_live, _html} = live(conn, Routes.postfire_show_path(conn, :show, postfire))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Postfire"

      assert_patch(show_live, Routes.postfire_show_path(conn, :edit, postfire))

      assert show_live
             |> form("#postfire-form", postfire: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#postfire-form", postfire: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.postfire_show_path(conn, :show, postfire))

      assert html =~ "Postfire updated successfully"
      assert html =~ "some updated body"
    end
  end
end
