defmodule TailwindgenWeb.Pasta2LiveTest do
  use TailwindgenWeb.ConnCase

  import Phoenix.LiveViewTest

  alias Tailwindgen.Tcsat2

  @create_attrs %{age: 42, title: "some title"}
  @update_attrs %{age: 43, title: "some updated title"}
  @invalid_attrs %{age: nil, title: nil}

  defp fixture(:pasta2) do
    {:ok, pasta2} = Tcsat2.create_pasta2(@create_attrs)
    pasta2
  end

  defp create_pasta2(_) do
    pasta2 = fixture(:pasta2)
    %{pasta2: pasta2}
  end

  describe "Index" do
    setup [:create_pasta2]

    test "lists all pasta2s", %{conn: conn, pasta2: pasta2} do
      {:ok, _index_live, html} = live(conn, Routes.pasta2_index_path(conn, :index))

      assert html =~ "Listing Pasta2s"
      assert html =~ pasta2.title
    end

    test "saves new pasta2", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.pasta2_index_path(conn, :index))

      assert index_live |> element("a", "New Pasta2") |> render_click() =~
               "New Pasta2"

      assert_patch(index_live, Routes.pasta2_index_path(conn, :new))

      assert index_live
             |> form("#pasta2-form", pasta2: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#pasta2-form", pasta2: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.pasta2_index_path(conn, :index))

      assert html =~ "Pasta2 created successfully"
      assert html =~ "some title"
    end

    test "updates pasta2 in listing", %{conn: conn, pasta2: pasta2} do
      {:ok, index_live, _html} = live(conn, Routes.pasta2_index_path(conn, :index))

      assert index_live |> element("#pasta2-#{pasta2.id} a", "Edit") |> render_click() =~
               "Edit Pasta2"

      assert_patch(index_live, Routes.pasta2_index_path(conn, :edit, pasta2))

      assert index_live
             |> form("#pasta2-form", pasta2: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#pasta2-form", pasta2: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.pasta2_index_path(conn, :index))

      assert html =~ "Pasta2 updated successfully"
      assert html =~ "some updated title"
    end

    test "deletes pasta2 in listing", %{conn: conn, pasta2: pasta2} do
      {:ok, index_live, _html} = live(conn, Routes.pasta2_index_path(conn, :index))

      assert index_live |> element("#pasta2-#{pasta2.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#pasta2-#{pasta2.id}")
    end
  end

  describe "Show" do
    setup [:create_pasta2]

    test "displays pasta2", %{conn: conn, pasta2: pasta2} do
      {:ok, _show_live, html} = live(conn, Routes.pasta2_show_path(conn, :show, pasta2))

      assert html =~ "Show Pasta2"
      assert html =~ pasta2.title
    end

    test "updates pasta2 within modal", %{conn: conn, pasta2: pasta2} do
      {:ok, show_live, _html} = live(conn, Routes.pasta2_show_path(conn, :show, pasta2))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Pasta2"

      assert_patch(show_live, Routes.pasta2_show_path(conn, :edit, pasta2))

      assert show_live
             |> form("#pasta2-form", pasta2: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#pasta2-form", pasta2: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.pasta2_show_path(conn, :show, pasta2))

      assert html =~ "Pasta2 updated successfully"
      assert html =~ "some updated title"
    end
  end
end
