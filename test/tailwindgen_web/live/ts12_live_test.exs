defmodule TailwindgenWeb.Ts12LiveTest do
  use TailwindgenWeb.ConnCase

  import Phoenix.LiveViewTest

  alias Tailwindgen.Tsc12

  @create_attrs %{age: 42, body: "some body", title: "some title"}
  @update_attrs %{age: 43, body: "some updated body", title: "some updated title"}
  @invalid_attrs %{age: nil, body: nil, title: nil}

  defp fixture(:ts12) do
    {:ok, ts12} = Tsc12.create_ts12(@create_attrs)
    ts12
  end

  defp create_ts12(_) do
    ts12 = fixture(:ts12)
    %{ts12: ts12}
  end

  describe "Index" do
    setup [:create_ts12]

    test "lists all ts12s", %{conn: conn, ts12: ts12} do
      {:ok, _index_live, html} = live(conn, Routes.ts12_index_path(conn, :index))

      assert html =~ "Listing Ts12s"
      assert html =~ ts12.body
    end

    test "saves new ts12", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.ts12_index_path(conn, :index))

      assert index_live |> element("a", "New Ts12") |> render_click() =~
               "New Ts12"

      assert_patch(index_live, Routes.ts12_index_path(conn, :new))

      assert index_live
             |> form("#ts12-form", ts12: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#ts12-form", ts12: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.ts12_index_path(conn, :index))

      assert html =~ "Ts12 created successfully"
      assert html =~ "some body"
    end

    test "updates ts12 in listing", %{conn: conn, ts12: ts12} do
      {:ok, index_live, _html} = live(conn, Routes.ts12_index_path(conn, :index))

      assert index_live |> element("#ts12-#{ts12.id} a", "Edit") |> render_click() =~
               "Edit Ts12"

      assert_patch(index_live, Routes.ts12_index_path(conn, :edit, ts12))

      assert index_live
             |> form("#ts12-form", ts12: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#ts12-form", ts12: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.ts12_index_path(conn, :index))

      assert html =~ "Ts12 updated successfully"
      assert html =~ "some updated body"
    end

    test "deletes ts12 in listing", %{conn: conn, ts12: ts12} do
      {:ok, index_live, _html} = live(conn, Routes.ts12_index_path(conn, :index))

      assert index_live |> element("#ts12-#{ts12.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#ts12-#{ts12.id}")
    end
  end

  describe "Show" do
    setup [:create_ts12]

    test "displays ts12", %{conn: conn, ts12: ts12} do
      {:ok, _show_live, html} = live(conn, Routes.ts12_show_path(conn, :show, ts12))

      assert html =~ "Show Ts12"
      assert html =~ ts12.body
    end

    test "updates ts12 within modal", %{conn: conn, ts12: ts12} do
      {:ok, show_live, _html} = live(conn, Routes.ts12_show_path(conn, :show, ts12))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Ts12"

      assert_patch(show_live, Routes.ts12_show_path(conn, :edit, ts12))

      assert show_live
             |> form("#ts12-form", ts12: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#ts12-form", ts12: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.ts12_show_path(conn, :show, ts12))

      assert html =~ "Ts12 updated successfully"
      assert html =~ "some updated body"
    end
  end
end
