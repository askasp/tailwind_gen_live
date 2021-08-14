defmodule TailwindgenWeb.Pasta7LiveTest do
  use TailwindgenWeb.ConnCase

  import Phoenix.LiveViewTest

  alias Tailwindgen.Tcsat7

  @create_attrs %{age: 42, title: "some title"}
  @update_attrs %{age: 43, title: "some updated title"}
  @invalid_attrs %{age: nil, title: nil}

  defp fixture(:pasta7) do
    {:ok, pasta7} = Tcsat7.create_pasta7(@create_attrs)
    pasta7
  end

  defp create_pasta7(_) do
    pasta7 = fixture(:pasta7)
    %{pasta7: pasta7}
  end

  describe "Index" do
    setup [:create_pasta7]

    test "lists all pasta7s", %{conn: conn, pasta7: pasta7} do
      {:ok, _index_live, html} = live(conn, Routes.pasta7_index_path(conn, :index))

      assert html =~ "Listing Pasta7s"
      assert html =~ pasta7.title
    end

    test "saves new pasta7", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.pasta7_index_path(conn, :index))

      assert index_live |> element("a", "New Pasta7") |> render_click() =~
               "New Pasta7"

      assert_patch(index_live, Routes.pasta7_index_path(conn, :new))

      assert index_live
             |> form("#pasta7-form", pasta7: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#pasta7-form", pasta7: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.pasta7_index_path(conn, :index))

      assert html =~ "Pasta7 created successfully"
      assert html =~ "some title"
    end

    test "updates pasta7 in listing", %{conn: conn, pasta7: pasta7} do
      {:ok, index_live, _html} = live(conn, Routes.pasta7_index_path(conn, :index))

      assert index_live |> element("#pasta7-#{pasta7.id} a", "Edit") |> render_click() =~
               "Edit Pasta7"

      assert_patch(index_live, Routes.pasta7_index_path(conn, :edit, pasta7))

      assert index_live
             |> form("#pasta7-form", pasta7: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#pasta7-form", pasta7: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.pasta7_index_path(conn, :index))

      assert html =~ "Pasta7 updated successfully"
      assert html =~ "some updated title"
    end

    test "deletes pasta7 in listing", %{conn: conn, pasta7: pasta7} do
      {:ok, index_live, _html} = live(conn, Routes.pasta7_index_path(conn, :index))

      assert index_live |> element("#pasta7-#{pasta7.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#pasta7-#{pasta7.id}")
    end
  end

  describe "Show" do
    setup [:create_pasta7]

    test "displays pasta7", %{conn: conn, pasta7: pasta7} do
      {:ok, _show_live, html} = live(conn, Routes.pasta7_show_path(conn, :show, pasta7))

      assert html =~ "Show Pasta7"
      assert html =~ pasta7.title
    end

    test "updates pasta7 within modal", %{conn: conn, pasta7: pasta7} do
      {:ok, show_live, _html} = live(conn, Routes.pasta7_show_path(conn, :show, pasta7))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Pasta7"

      assert_patch(show_live, Routes.pasta7_show_path(conn, :edit, pasta7))

      assert show_live
             |> form("#pasta7-form", pasta7: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#pasta7-form", pasta7: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.pasta7_show_path(conn, :show, pasta7))

      assert html =~ "Pasta7 updated successfully"
      assert html =~ "some updated title"
    end
  end
end
