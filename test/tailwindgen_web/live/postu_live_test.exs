defmodule TailwindgenWeb.PostuLiveTest do
  use TailwindgenWeb.ConnCase

  import Phoenix.LiveViewTest

  alias Tailwindgen.Tust

  @create_attrs %{body: "some body", title: "some title"}
  @update_attrs %{body: "some updated body", title: "some updated title"}
  @invalid_attrs %{body: nil, title: nil}

  defp fixture(:postu) do
    {:ok, postu} = Tust.create_postu(@create_attrs)
    postu
  end

  defp create_postu(_) do
    postu = fixture(:postu)
    %{postu: postu}
  end

  describe "Index" do
    setup [:create_postu]

    test "lists all postus", %{conn: conn, postu: postu} do
      {:ok, _index_live, html} = live(conn, Routes.postu_index_path(conn, :index))

      assert html =~ "Listing Postus"
      assert html =~ postu.body
    end

    test "saves new postu", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.postu_index_path(conn, :index))

      assert index_live |> element("a", "New Postu") |> render_click() =~
               "New Postu"

      assert_patch(index_live, Routes.postu_index_path(conn, :new))

      assert index_live
             |> form("#postu-form", postu: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#postu-form", postu: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.postu_index_path(conn, :index))

      assert html =~ "Postu created successfully"
      assert html =~ "some body"
    end

    test "updates postu in listing", %{conn: conn, postu: postu} do
      {:ok, index_live, _html} = live(conn, Routes.postu_index_path(conn, :index))

      assert index_live |> element("#postu-#{postu.id} a", "Edit") |> render_click() =~
               "Edit Postu"

      assert_patch(index_live, Routes.postu_index_path(conn, :edit, postu))

      assert index_live
             |> form("#postu-form", postu: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#postu-form", postu: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.postu_index_path(conn, :index))

      assert html =~ "Postu updated successfully"
      assert html =~ "some updated body"
    end

    test "deletes postu in listing", %{conn: conn, postu: postu} do
      {:ok, index_live, _html} = live(conn, Routes.postu_index_path(conn, :index))

      assert index_live |> element("#postu-#{postu.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#postu-#{postu.id}")
    end
  end

  describe "Show" do
    setup [:create_postu]

    test "displays postu", %{conn: conn, postu: postu} do
      {:ok, _show_live, html} = live(conn, Routes.postu_show_path(conn, :show, postu))

      assert html =~ "Show Postu"
      assert html =~ postu.body
    end

    test "updates postu within modal", %{conn: conn, postu: postu} do
      {:ok, show_live, _html} = live(conn, Routes.postu_show_path(conn, :show, postu))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Postu"

      assert_patch(show_live, Routes.postu_show_path(conn, :edit, postu))

      assert show_live
             |> form("#postu-form", postu: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#postu-form", postu: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.postu_show_path(conn, :show, postu))

      assert html =~ "Postu updated successfully"
      assert html =~ "some updated body"
    end
  end
end
