defmodule TailwindgenWeb.Pasta3LiveTest do
  use TailwindgenWeb.ConnCase

  import Phoenix.LiveViewTest

  alias Tailwindgen.Tcsat3

  @create_attrs %{age: 42, title: "some title"}
  @update_attrs %{age: 43, title: "some updated title"}
  @invalid_attrs %{age: nil, title: nil}

  defp fixture(:pasta3) do
    {:ok, pasta3} = Tcsat3.create_pasta3(@create_attrs)
    pasta3
  end

  defp create_pasta3(_) do
    pasta3 = fixture(:pasta3)
    %{pasta3: pasta3}
  end

  describe "Index" do
    setup [:create_pasta3]

    test "lists all pasta3s", %{conn: conn, pasta3: pasta3} do
      {:ok, _index_live, html} = live(conn, Routes.pasta3_index_path(conn, :index))

      assert html =~ "Listing Pasta3s"
      assert html =~ pasta3.title
    end

    test "saves new pasta3", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.pasta3_index_path(conn, :index))

      assert index_live |> element("a", "New Pasta3") |> render_click() =~
               "New Pasta3"

      assert_patch(index_live, Routes.pasta3_index_path(conn, :new))

      assert index_live
             |> form("#pasta3-form", pasta3: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#pasta3-form", pasta3: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.pasta3_index_path(conn, :index))

      assert html =~ "Pasta3 created successfully"
      assert html =~ "some title"
    end

    test "updates pasta3 in listing", %{conn: conn, pasta3: pasta3} do
      {:ok, index_live, _html} = live(conn, Routes.pasta3_index_path(conn, :index))

      assert index_live |> element("#pasta3-#{pasta3.id} a", "Edit") |> render_click() =~
               "Edit Pasta3"

      assert_patch(index_live, Routes.pasta3_index_path(conn, :edit, pasta3))

      assert index_live
             |> form("#pasta3-form", pasta3: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#pasta3-form", pasta3: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.pasta3_index_path(conn, :index))

      assert html =~ "Pasta3 updated successfully"
      assert html =~ "some updated title"
    end

    test "deletes pasta3 in listing", %{conn: conn, pasta3: pasta3} do
      {:ok, index_live, _html} = live(conn, Routes.pasta3_index_path(conn, :index))

      assert index_live |> element("#pasta3-#{pasta3.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#pasta3-#{pasta3.id}")
    end
  end

  describe "Show" do
    setup [:create_pasta3]

    test "displays pasta3", %{conn: conn, pasta3: pasta3} do
      {:ok, _show_live, html} = live(conn, Routes.pasta3_show_path(conn, :show, pasta3))

      assert html =~ "Show Pasta3"
      assert html =~ pasta3.title
    end

    test "updates pasta3 within modal", %{conn: conn, pasta3: pasta3} do
      {:ok, show_live, _html} = live(conn, Routes.pasta3_show_path(conn, :show, pasta3))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Pasta3"

      assert_patch(show_live, Routes.pasta3_show_path(conn, :edit, pasta3))

      assert show_live
             |> form("#pasta3-form", pasta3: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#pasta3-form", pasta3: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.pasta3_show_path(conn, :show, pasta3))

      assert html =~ "Pasta3 updated successfully"
      assert html =~ "some updated title"
    end
  end
end
