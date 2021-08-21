defmodule TailwindgenWeb.Ts11LiveTest do
  use TailwindgenWeb.ConnCase

  import Phoenix.LiveViewTest

  alias Tailwindgen.Tsc11

  @create_attrs %{age: 42, body: "some body", title: "some title"}
  @update_attrs %{age: 43, body: "some updated body", title: "some updated title"}
  @invalid_attrs %{age: nil, body: nil, title: nil}

  defp fixture(:ts11) do
    {:ok, ts11} = Tsc11.create_ts11(@create_attrs)
    ts11
  end

  defp create_ts11(_) do
    ts11 = fixture(:ts11)
    %{ts11: ts11}
  end

  describe "Index" do
    setup [:create_ts11]

    test "lists all ts11s", %{conn: conn, ts11: ts11} do
      {:ok, _index_live, html} = live(conn, Routes.ts11_index_path(conn, :index))

      assert html =~ "Listing Ts11s"
      assert html =~ ts11.body
    end

    test "saves new ts11", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.ts11_index_path(conn, :index))

      assert index_live |> element("a", "New Ts11") |> render_click() =~
               "New Ts11"

      assert_patch(index_live, Routes.ts11_index_path(conn, :new))

      assert index_live
             |> form("#ts11-form", ts11: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#ts11-form", ts11: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.ts11_index_path(conn, :index))

      assert html =~ "Ts11 created successfully"
      assert html =~ "some body"
    end

    test "updates ts11 in listing", %{conn: conn, ts11: ts11} do
      {:ok, index_live, _html} = live(conn, Routes.ts11_index_path(conn, :index))

      assert index_live |> element("#ts11-#{ts11.id} a", "Edit") |> render_click() =~
               "Edit Ts11"

      assert_patch(index_live, Routes.ts11_index_path(conn, :edit, ts11))

      assert index_live
             |> form("#ts11-form", ts11: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#ts11-form", ts11: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.ts11_index_path(conn, :index))

      assert html =~ "Ts11 updated successfully"
      assert html =~ "some updated body"
    end

    test "deletes ts11 in listing", %{conn: conn, ts11: ts11} do
      {:ok, index_live, _html} = live(conn, Routes.ts11_index_path(conn, :index))

      assert index_live |> element("#ts11-#{ts11.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#ts11-#{ts11.id}")
    end
  end

  describe "Show" do
    setup [:create_ts11]

    test "displays ts11", %{conn: conn, ts11: ts11} do
      {:ok, _show_live, html} = live(conn, Routes.ts11_show_path(conn, :show, ts11))

      assert html =~ "Show Ts11"
      assert html =~ ts11.body
    end

    test "updates ts11 within modal", %{conn: conn, ts11: ts11} do
      {:ok, show_live, _html} = live(conn, Routes.ts11_show_path(conn, :show, ts11))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Ts11"

      assert_patch(show_live, Routes.ts11_show_path(conn, :edit, ts11))

      assert show_live
             |> form("#ts11-form", ts11: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#ts11-form", ts11: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.ts11_show_path(conn, :show, ts11))

      assert html =~ "Ts11 updated successfully"
      assert html =~ "some updated body"
    end
  end
end
