defmodule TailwindgenWeb.PosteLiveTest do
  use TailwindgenWeb.ConnCase

  import Phoenix.LiveViewTest

  alias Tailwindgen.Tgst

  @create_attrs %{body: "some body", title: "some title"}
  @update_attrs %{body: "some updated body", title: "some updated title"}
  @invalid_attrs %{body: nil, title: nil}

  defp fixture(:poste) do
    {:ok, poste} = Tgst.create_poste(@create_attrs)
    poste
  end

  defp create_poste(_) do
    poste = fixture(:poste)
    %{poste: poste}
  end

  describe "Index" do
    setup [:create_poste]

    test "lists all postes", %{conn: conn, poste: poste} do
      {:ok, _index_live, html} = live(conn, Routes.poste_index_path(conn, :index))

      assert html =~ "Listing Postes"
      assert html =~ poste.body
    end

    test "saves new poste", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.poste_index_path(conn, :index))

      assert index_live |> element("a", "New Poste") |> render_click() =~
               "New Poste"

      assert_patch(index_live, Routes.poste_index_path(conn, :new))

      assert index_live
             |> form("#poste-form", poste: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#poste-form", poste: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.poste_index_path(conn, :index))

      assert html =~ "Poste created successfully"
      assert html =~ "some body"
    end

    test "updates poste in listing", %{conn: conn, poste: poste} do
      {:ok, index_live, _html} = live(conn, Routes.poste_index_path(conn, :index))

      assert index_live |> element("#poste-#{poste.id} a", "Edit") |> render_click() =~
               "Edit Poste"

      assert_patch(index_live, Routes.poste_index_path(conn, :edit, poste))

      assert index_live
             |> form("#poste-form", poste: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#poste-form", poste: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.poste_index_path(conn, :index))

      assert html =~ "Poste updated successfully"
      assert html =~ "some updated body"
    end

    test "deletes poste in listing", %{conn: conn, poste: poste} do
      {:ok, index_live, _html} = live(conn, Routes.poste_index_path(conn, :index))

      assert index_live |> element("#poste-#{poste.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#poste-#{poste.id}")
    end
  end

  describe "Show" do
    setup [:create_poste]

    test "displays poste", %{conn: conn, poste: poste} do
      {:ok, _show_live, html} = live(conn, Routes.poste_show_path(conn, :show, poste))

      assert html =~ "Show Poste"
      assert html =~ poste.body
    end

    test "updates poste within modal", %{conn: conn, poste: poste} do
      {:ok, show_live, _html} = live(conn, Routes.poste_show_path(conn, :show, poste))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Poste"

      assert_patch(show_live, Routes.poste_show_path(conn, :edit, poste))

      assert show_live
             |> form("#poste-form", poste: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#poste-form", poste: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.poste_show_path(conn, :show, poste))

      assert html =~ "Poste updated successfully"
      assert html =~ "some updated body"
    end
  end
end
