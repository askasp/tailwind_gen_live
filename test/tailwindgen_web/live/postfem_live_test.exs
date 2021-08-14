defmodule TailwindgenWeb.PostfemLiveTest do
  use TailwindgenWeb.ConnCase

  import Phoenix.LiveViewTest

  alias Tailwindgen.Test5

  @create_attrs %{body: "some body", title: "some title"}
  @update_attrs %{body: "some updated body", title: "some updated title"}
  @invalid_attrs %{body: nil, title: nil}

  defp fixture(:postfem) do
    {:ok, postfem} = Test5.create_postfem(@create_attrs)
    postfem
  end

  defp create_postfem(_) do
    postfem = fixture(:postfem)
    %{postfem: postfem}
  end

  describe "Index" do
    setup [:create_postfem]

    test "lists all postfems", %{conn: conn, postfem: postfem} do
      {:ok, _index_live, html} = live(conn, Routes.postfem_index_path(conn, :index))

      assert html =~ "Listing Postfems"
      assert html =~ postfem.body
    end

    test "saves new postfem", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.postfem_index_path(conn, :index))

      assert index_live |> element("a", "New Postfem") |> render_click() =~
               "New Postfem"

      assert_patch(index_live, Routes.postfem_index_path(conn, :new))

      assert index_live
             |> form("#postfem-form", postfem: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#postfem-form", postfem: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.postfem_index_path(conn, :index))

      assert html =~ "Postfem created successfully"
      assert html =~ "some body"
    end

    test "updates postfem in listing", %{conn: conn, postfem: postfem} do
      {:ok, index_live, _html} = live(conn, Routes.postfem_index_path(conn, :index))

      assert index_live |> element("#postfem-#{postfem.id} a", "Edit") |> render_click() =~
               "Edit Postfem"

      assert_patch(index_live, Routes.postfem_index_path(conn, :edit, postfem))

      assert index_live
             |> form("#postfem-form", postfem: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#postfem-form", postfem: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.postfem_index_path(conn, :index))

      assert html =~ "Postfem updated successfully"
      assert html =~ "some updated body"
    end

    test "deletes postfem in listing", %{conn: conn, postfem: postfem} do
      {:ok, index_live, _html} = live(conn, Routes.postfem_index_path(conn, :index))

      assert index_live |> element("#postfem-#{postfem.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#postfem-#{postfem.id}")
    end
  end

  describe "Show" do
    setup [:create_postfem]

    test "displays postfem", %{conn: conn, postfem: postfem} do
      {:ok, _show_live, html} = live(conn, Routes.postfem_show_path(conn, :show, postfem))

      assert html =~ "Show Postfem"
      assert html =~ postfem.body
    end

    test "updates postfem within modal", %{conn: conn, postfem: postfem} do
      {:ok, show_live, _html} = live(conn, Routes.postfem_show_path(conn, :show, postfem))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Postfem"

      assert_patch(show_live, Routes.postfem_show_path(conn, :edit, postfem))

      assert show_live
             |> form("#postfem-form", postfem: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#postfem-form", postfem: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.postfem_show_path(conn, :show, postfem))

      assert html =~ "Postfem updated successfully"
      assert html =~ "some updated body"
    end
  end
end
