defmodule TailwindgenWeb.Ts13LiveTest do
  use TailwindgenWeb.ConnCase

  import Phoenix.LiveViewTest

  alias Tailwindgen.Tsc13

  @create_attrs %{age: 42, body: "some body", title: "some title"}
  @update_attrs %{age: 43, body: "some updated body", title: "some updated title"}
  @invalid_attrs %{age: nil, body: nil, title: nil}

  defp fixture(:ts13) do
    {:ok, ts13} = Tsc13.create_ts13(@create_attrs)
    ts13
  end

  defp create_ts13(_) do
    ts13 = fixture(:ts13)
    %{ts13: ts13}
  end

  describe "Index" do
    setup [:create_ts13]

    test "lists all ts13s", %{conn: conn, ts13: ts13} do
      {:ok, _index_live, html} = live(conn, Routes.ts13_index_path(conn, :index))

      assert html =~ "Listing Ts13s"
      assert html =~ ts13.body
    end

    test "saves new ts13", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.ts13_index_path(conn, :index))

      assert index_live |> element("a", "New Ts13") |> render_click() =~
               "New Ts13"

      assert_patch(index_live, Routes.ts13_index_path(conn, :new))

      assert index_live
             |> form("#ts13-form", ts13: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#ts13-form", ts13: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.ts13_index_path(conn, :index))

      assert html =~ "Ts13 created successfully"
      assert html =~ "some body"
    end

    test "updates ts13 in listing", %{conn: conn, ts13: ts13} do
      {:ok, index_live, _html} = live(conn, Routes.ts13_index_path(conn, :index))

      assert index_live |> element("#ts13-#{ts13.id} a", "Edit") |> render_click() =~
               "Edit Ts13"

      assert_patch(index_live, Routes.ts13_index_path(conn, :edit, ts13))

      assert index_live
             |> form("#ts13-form", ts13: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#ts13-form", ts13: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.ts13_index_path(conn, :index))

      assert html =~ "Ts13 updated successfully"
      assert html =~ "some updated body"
    end

    test "deletes ts13 in listing", %{conn: conn, ts13: ts13} do
      {:ok, index_live, _html} = live(conn, Routes.ts13_index_path(conn, :index))

      assert index_live |> element("#ts13-#{ts13.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#ts13-#{ts13.id}")
    end
  end

  describe "Show" do
    setup [:create_ts13]

    test "displays ts13", %{conn: conn, ts13: ts13} do
      {:ok, _show_live, html} = live(conn, Routes.ts13_show_path(conn, :show, ts13))

      assert html =~ "Show Ts13"
      assert html =~ ts13.body
    end

    test "updates ts13 within modal", %{conn: conn, ts13: ts13} do
      {:ok, show_live, _html} = live(conn, Routes.ts13_show_path(conn, :show, ts13))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Ts13"

      assert_patch(show_live, Routes.ts13_show_path(conn, :edit, ts13))

      assert show_live
             |> form("#ts13-form", ts13: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#ts13-form", ts13: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.ts13_show_path(conn, :show, ts13))

      assert html =~ "Ts13 updated successfully"
      assert html =~ "some updated body"
    end
  end
end
