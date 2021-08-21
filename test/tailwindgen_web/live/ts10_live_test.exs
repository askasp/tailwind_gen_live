defmodule TailwindgenWeb.Ts10LiveTest do
  use TailwindgenWeb.ConnCase

  import Phoenix.LiveViewTest

  alias Tailwindgen.Tsc10

  @create_attrs %{age: 42, body: "some body", title: "some title"}
  @update_attrs %{age: 43, body: "some updated body", title: "some updated title"}
  @invalid_attrs %{age: nil, body: nil, title: nil}

  defp fixture(:ts10) do
    {:ok, ts10} = Tsc10.create_ts10(@create_attrs)
    ts10
  end

  defp create_ts10(_) do
    ts10 = fixture(:ts10)
    %{ts10: ts10}
  end

  describe "Index" do
    setup [:create_ts10]

    test "lists all ts10s", %{conn: conn, ts10: ts10} do
      {:ok, _index_live, html} = live(conn, Routes.ts10_index_path(conn, :index))

      assert html =~ "Listing Ts10s"
      assert html =~ ts10.body
    end

    test "saves new ts10", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.ts10_index_path(conn, :index))

      assert index_live |> element("a", "New Ts10") |> render_click() =~
               "New Ts10"

      assert_patch(index_live, Routes.ts10_index_path(conn, :new))

      assert index_live
             |> form("#ts10-form", ts10: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#ts10-form", ts10: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.ts10_index_path(conn, :index))

      assert html =~ "Ts10 created successfully"
      assert html =~ "some body"
    end

    test "updates ts10 in listing", %{conn: conn, ts10: ts10} do
      {:ok, index_live, _html} = live(conn, Routes.ts10_index_path(conn, :index))

      assert index_live |> element("#ts10-#{ts10.id} a", "Edit") |> render_click() =~
               "Edit Ts10"

      assert_patch(index_live, Routes.ts10_index_path(conn, :edit, ts10))

      assert index_live
             |> form("#ts10-form", ts10: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#ts10-form", ts10: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.ts10_index_path(conn, :index))

      assert html =~ "Ts10 updated successfully"
      assert html =~ "some updated body"
    end

    test "deletes ts10 in listing", %{conn: conn, ts10: ts10} do
      {:ok, index_live, _html} = live(conn, Routes.ts10_index_path(conn, :index))

      assert index_live |> element("#ts10-#{ts10.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#ts10-#{ts10.id}")
    end
  end

  describe "Show" do
    setup [:create_ts10]

    test "displays ts10", %{conn: conn, ts10: ts10} do
      {:ok, _show_live, html} = live(conn, Routes.ts10_show_path(conn, :show, ts10))

      assert html =~ "Show Ts10"
      assert html =~ ts10.body
    end

    test "updates ts10 within modal", %{conn: conn, ts10: ts10} do
      {:ok, show_live, _html} = live(conn, Routes.ts10_show_path(conn, :show, ts10))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Ts10"

      assert_patch(show_live, Routes.ts10_show_path(conn, :edit, ts10))

      assert show_live
             |> form("#ts10-form", ts10: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#ts10-form", ts10: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.ts10_show_path(conn, :show, ts10))

      assert html =~ "Ts10 updated successfully"
      assert html =~ "some updated body"
    end
  end
end
