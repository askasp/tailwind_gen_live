defmodule TailwindgenWeb.Pasta6LiveTest do
  use TailwindgenWeb.ConnCase

  import Phoenix.LiveViewTest

  alias Tailwindgen.Tcsat6

  @create_attrs %{age: 42, title: "some title"}
  @update_attrs %{age: 43, title: "some updated title"}
  @invalid_attrs %{age: nil, title: nil}

  defp fixture(:pasta6) do
    {:ok, pasta6} = Tcsat6.create_pasta6(@create_attrs)
    pasta6
  end

  defp create_pasta6(_) do
    pasta6 = fixture(:pasta6)
    %{pasta6: pasta6}
  end

  describe "Index" do
    setup [:create_pasta6]

    test "lists all pasta6s", %{conn: conn, pasta6: pasta6} do
      {:ok, _index_live, html} = live(conn, Routes.pasta6_index_path(conn, :index))

      assert html =~ "Listing Pasta6s"
      assert html =~ pasta6.title
    end

    test "saves new pasta6", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.pasta6_index_path(conn, :index))

      assert index_live |> element("a", "New Pasta6") |> render_click() =~
               "New Pasta6"

      assert_patch(index_live, Routes.pasta6_index_path(conn, :new))

      assert index_live
             |> form("#pasta6-form", pasta6: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#pasta6-form", pasta6: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.pasta6_index_path(conn, :index))

      assert html =~ "Pasta6 created successfully"
      assert html =~ "some title"
    end

    test "updates pasta6 in listing", %{conn: conn, pasta6: pasta6} do
      {:ok, index_live, _html} = live(conn, Routes.pasta6_index_path(conn, :index))

      assert index_live |> element("#pasta6-#{pasta6.id} a", "Edit") |> render_click() =~
               "Edit Pasta6"

      assert_patch(index_live, Routes.pasta6_index_path(conn, :edit, pasta6))

      assert index_live
             |> form("#pasta6-form", pasta6: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#pasta6-form", pasta6: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.pasta6_index_path(conn, :index))

      assert html =~ "Pasta6 updated successfully"
      assert html =~ "some updated title"
    end

    test "deletes pasta6 in listing", %{conn: conn, pasta6: pasta6} do
      {:ok, index_live, _html} = live(conn, Routes.pasta6_index_path(conn, :index))

      assert index_live |> element("#pasta6-#{pasta6.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#pasta6-#{pasta6.id}")
    end
  end

  describe "Show" do
    setup [:create_pasta6]

    test "displays pasta6", %{conn: conn, pasta6: pasta6} do
      {:ok, _show_live, html} = live(conn, Routes.pasta6_show_path(conn, :show, pasta6))

      assert html =~ "Show Pasta6"
      assert html =~ pasta6.title
    end

    test "updates pasta6 within modal", %{conn: conn, pasta6: pasta6} do
      {:ok, show_live, _html} = live(conn, Routes.pasta6_show_path(conn, :show, pasta6))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Pasta6"

      assert_patch(show_live, Routes.pasta6_show_path(conn, :edit, pasta6))

      assert show_live
             |> form("#pasta6-form", pasta6: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#pasta6-form", pasta6: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.pasta6_show_path(conn, :show, pasta6))

      assert html =~ "Pasta6 updated successfully"
      assert html =~ "some updated title"
    end
  end
end
