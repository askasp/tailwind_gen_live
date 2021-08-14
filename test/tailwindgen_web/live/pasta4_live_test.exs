defmodule TailwindgenWeb.Pasta4LiveTest do
  use TailwindgenWeb.ConnCase

  import Phoenix.LiveViewTest

  alias Tailwindgen.Tcsat4

  @create_attrs %{age: 42, title: "some title"}
  @update_attrs %{age: 43, title: "some updated title"}
  @invalid_attrs %{age: nil, title: nil}

  defp fixture(:pasta4) do
    {:ok, pasta4} = Tcsat4.create_pasta4(@create_attrs)
    pasta4
  end

  defp create_pasta4(_) do
    pasta4 = fixture(:pasta4)
    %{pasta4: pasta4}
  end

  describe "Index" do
    setup [:create_pasta4]

    test "lists all pasta4s", %{conn: conn, pasta4: pasta4} do
      {:ok, _index_live, html} = live(conn, Routes.pasta4_index_path(conn, :index))

      assert html =~ "Listing Pasta4s"
      assert html =~ pasta4.title
    end

    test "saves new pasta4", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.pasta4_index_path(conn, :index))

      assert index_live |> element("a", "New Pasta4") |> render_click() =~
               "New Pasta4"

      assert_patch(index_live, Routes.pasta4_index_path(conn, :new))

      assert index_live
             |> form("#pasta4-form", pasta4: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#pasta4-form", pasta4: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.pasta4_index_path(conn, :index))

      assert html =~ "Pasta4 created successfully"
      assert html =~ "some title"
    end

    test "updates pasta4 in listing", %{conn: conn, pasta4: pasta4} do
      {:ok, index_live, _html} = live(conn, Routes.pasta4_index_path(conn, :index))

      assert index_live |> element("#pasta4-#{pasta4.id} a", "Edit") |> render_click() =~
               "Edit Pasta4"

      assert_patch(index_live, Routes.pasta4_index_path(conn, :edit, pasta4))

      assert index_live
             |> form("#pasta4-form", pasta4: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#pasta4-form", pasta4: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.pasta4_index_path(conn, :index))

      assert html =~ "Pasta4 updated successfully"
      assert html =~ "some updated title"
    end

    test "deletes pasta4 in listing", %{conn: conn, pasta4: pasta4} do
      {:ok, index_live, _html} = live(conn, Routes.pasta4_index_path(conn, :index))

      assert index_live |> element("#pasta4-#{pasta4.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#pasta4-#{pasta4.id}")
    end
  end

  describe "Show" do
    setup [:create_pasta4]

    test "displays pasta4", %{conn: conn, pasta4: pasta4} do
      {:ok, _show_live, html} = live(conn, Routes.pasta4_show_path(conn, :show, pasta4))

      assert html =~ "Show Pasta4"
      assert html =~ pasta4.title
    end

    test "updates pasta4 within modal", %{conn: conn, pasta4: pasta4} do
      {:ok, show_live, _html} = live(conn, Routes.pasta4_show_path(conn, :show, pasta4))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Pasta4"

      assert_patch(show_live, Routes.pasta4_show_path(conn, :edit, pasta4))

      assert show_live
             |> form("#pasta4-form", pasta4: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#pasta4-form", pasta4: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.pasta4_show_path(conn, :show, pasta4))

      assert html =~ "Pasta4 updated successfully"
      assert html =~ "some updated title"
    end
  end
end
