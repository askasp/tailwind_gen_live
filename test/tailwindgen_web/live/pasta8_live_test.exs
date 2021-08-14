defmodule TailwindgenWeb.Pasta8LiveTest do
  use TailwindgenWeb.ConnCase

  import Phoenix.LiveViewTest

  alias Tailwindgen.Tcsat8

  @create_attrs %{age: 42, stuff: %{}, title: "some title"}
  @update_attrs %{age: 43, stuff: %{}, title: "some updated title"}
  @invalid_attrs %{age: nil, stuff: nil, title: nil}

  defp fixture(:pasta8) do
    {:ok, pasta8} = Tcsat8.create_pasta8(@create_attrs)
    pasta8
  end

  defp create_pasta8(_) do
    pasta8 = fixture(:pasta8)
    %{pasta8: pasta8}
  end

  describe "Index" do
    setup [:create_pasta8]

    test "lists all pasta8s", %{conn: conn, pasta8: pasta8} do
      {:ok, _index_live, html} = live(conn, Routes.pasta8_index_path(conn, :index))

      assert html =~ "Listing Pasta8s"
      assert html =~ pasta8.title
    end

    test "saves new pasta8", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.pasta8_index_path(conn, :index))

      assert index_live |> element("a", "New Pasta8") |> render_click() =~
               "New Pasta8"

      assert_patch(index_live, Routes.pasta8_index_path(conn, :new))

      assert index_live
             |> form("#pasta8-form", pasta8: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#pasta8-form", pasta8: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.pasta8_index_path(conn, :index))

      assert html =~ "Pasta8 created successfully"
      assert html =~ "some title"
    end

    test "updates pasta8 in listing", %{conn: conn, pasta8: pasta8} do
      {:ok, index_live, _html} = live(conn, Routes.pasta8_index_path(conn, :index))

      assert index_live |> element("#pasta8-#{pasta8.id} a", "Edit") |> render_click() =~
               "Edit Pasta8"

      assert_patch(index_live, Routes.pasta8_index_path(conn, :edit, pasta8))

      assert index_live
             |> form("#pasta8-form", pasta8: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#pasta8-form", pasta8: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.pasta8_index_path(conn, :index))

      assert html =~ "Pasta8 updated successfully"
      assert html =~ "some updated title"
    end

    test "deletes pasta8 in listing", %{conn: conn, pasta8: pasta8} do
      {:ok, index_live, _html} = live(conn, Routes.pasta8_index_path(conn, :index))

      assert index_live |> element("#pasta8-#{pasta8.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#pasta8-#{pasta8.id}")
    end
  end

  describe "Show" do
    setup [:create_pasta8]

    test "displays pasta8", %{conn: conn, pasta8: pasta8} do
      {:ok, _show_live, html} = live(conn, Routes.pasta8_show_path(conn, :show, pasta8))

      assert html =~ "Show Pasta8"
      assert html =~ pasta8.title
    end

    test "updates pasta8 within modal", %{conn: conn, pasta8: pasta8} do
      {:ok, show_live, _html} = live(conn, Routes.pasta8_show_path(conn, :show, pasta8))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Pasta8"

      assert_patch(show_live, Routes.pasta8_show_path(conn, :edit, pasta8))

      assert show_live
             |> form("#pasta8-form", pasta8: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#pasta8-form", pasta8: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.pasta8_show_path(conn, :show, pasta8))

      assert html =~ "Pasta8 updated successfully"
      assert html =~ "some updated title"
    end
  end
end
