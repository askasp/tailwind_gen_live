defmodule TailwindgenWeb.Pasta5LiveTest do
  use TailwindgenWeb.ConnCase

  import Phoenix.LiveViewTest

  alias Tailwindgen.Tcsat5

  @create_attrs %{age: 42, title: "some title"}
  @update_attrs %{age: 43, title: "some updated title"}
  @invalid_attrs %{age: nil, title: nil}

  defp fixture(:pasta5) do
    {:ok, pasta5} = Tcsat5.create_pasta5(@create_attrs)
    pasta5
  end

  defp create_pasta5(_) do
    pasta5 = fixture(:pasta5)
    %{pasta5: pasta5}
  end

  describe "Index" do
    setup [:create_pasta5]

    test "lists all pasta5s", %{conn: conn, pasta5: pasta5} do
      {:ok, _index_live, html} = live(conn, Routes.pasta5_index_path(conn, :index))

      assert html =~ "Listing Pasta5s"
      assert html =~ pasta5.title
    end

    test "saves new pasta5", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.pasta5_index_path(conn, :index))

      assert index_live |> element("a", "New Pasta5") |> render_click() =~
               "New Pasta5"

      assert_patch(index_live, Routes.pasta5_index_path(conn, :new))

      assert index_live
             |> form("#pasta5-form", pasta5: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#pasta5-form", pasta5: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.pasta5_index_path(conn, :index))

      assert html =~ "Pasta5 created successfully"
      assert html =~ "some title"
    end

    test "updates pasta5 in listing", %{conn: conn, pasta5: pasta5} do
      {:ok, index_live, _html} = live(conn, Routes.pasta5_index_path(conn, :index))

      assert index_live |> element("#pasta5-#{pasta5.id} a", "Edit") |> render_click() =~
               "Edit Pasta5"

      assert_patch(index_live, Routes.pasta5_index_path(conn, :edit, pasta5))

      assert index_live
             |> form("#pasta5-form", pasta5: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#pasta5-form", pasta5: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.pasta5_index_path(conn, :index))

      assert html =~ "Pasta5 updated successfully"
      assert html =~ "some updated title"
    end

    test "deletes pasta5 in listing", %{conn: conn, pasta5: pasta5} do
      {:ok, index_live, _html} = live(conn, Routes.pasta5_index_path(conn, :index))

      assert index_live |> element("#pasta5-#{pasta5.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#pasta5-#{pasta5.id}")
    end
  end

  describe "Show" do
    setup [:create_pasta5]

    test "displays pasta5", %{conn: conn, pasta5: pasta5} do
      {:ok, _show_live, html} = live(conn, Routes.pasta5_show_path(conn, :show, pasta5))

      assert html =~ "Show Pasta5"
      assert html =~ pasta5.title
    end

    test "updates pasta5 within modal", %{conn: conn, pasta5: pasta5} do
      {:ok, show_live, _html} = live(conn, Routes.pasta5_show_path(conn, :show, pasta5))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Pasta5"

      assert_patch(show_live, Routes.pasta5_show_path(conn, :edit, pasta5))

      assert show_live
             |> form("#pasta5-form", pasta5: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#pasta5-form", pasta5: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.pasta5_show_path(conn, :show, pasta5))

      assert html =~ "Pasta5 updated successfully"
      assert html =~ "some updated title"
    end
  end
end
