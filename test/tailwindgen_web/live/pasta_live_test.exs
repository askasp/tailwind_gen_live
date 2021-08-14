defmodule TailwindgenWeb.PastaLiveTest do
  use TailwindgenWeb.ConnCase

  import Phoenix.LiveViewTest

  alias Tailwindgen.Tcsat

  @create_attrs %{age: 42, title: "some title"}
  @update_attrs %{age: 43, title: "some updated title"}
  @invalid_attrs %{age: nil, title: nil}

  defp fixture(:pasta) do
    {:ok, pasta} = Tcsat.create_pasta(@create_attrs)
    pasta
  end

  defp create_pasta(_) do
    pasta = fixture(:pasta)
    %{pasta: pasta}
  end

  describe "Index" do
    setup [:create_pasta]

    test "lists all pastas", %{conn: conn, pasta: pasta} do
      {:ok, _index_live, html} = live(conn, Routes.pasta_index_path(conn, :index))

      assert html =~ "Listing Pastas"
      assert html =~ pasta.title
    end

    test "saves new pasta", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.pasta_index_path(conn, :index))

      assert index_live |> element("a", "New Pasta") |> render_click() =~
               "New Pasta"

      assert_patch(index_live, Routes.pasta_index_path(conn, :new))

      assert index_live
             |> form("#pasta-form", pasta: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#pasta-form", pasta: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.pasta_index_path(conn, :index))

      assert html =~ "Pasta created successfully"
      assert html =~ "some title"
    end

    test "updates pasta in listing", %{conn: conn, pasta: pasta} do
      {:ok, index_live, _html} = live(conn, Routes.pasta_index_path(conn, :index))

      assert index_live |> element("#pasta-#{pasta.id} a", "Edit") |> render_click() =~
               "Edit Pasta"

      assert_patch(index_live, Routes.pasta_index_path(conn, :edit, pasta))

      assert index_live
             |> form("#pasta-form", pasta: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#pasta-form", pasta: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.pasta_index_path(conn, :index))

      assert html =~ "Pasta updated successfully"
      assert html =~ "some updated title"
    end

    test "deletes pasta in listing", %{conn: conn, pasta: pasta} do
      {:ok, index_live, _html} = live(conn, Routes.pasta_index_path(conn, :index))

      assert index_live |> element("#pasta-#{pasta.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#pasta-#{pasta.id}")
    end
  end

  describe "Show" do
    setup [:create_pasta]

    test "displays pasta", %{conn: conn, pasta: pasta} do
      {:ok, _show_live, html} = live(conn, Routes.pasta_show_path(conn, :show, pasta))

      assert html =~ "Show Pasta"
      assert html =~ pasta.title
    end

    test "updates pasta within modal", %{conn: conn, pasta: pasta} do
      {:ok, show_live, _html} = live(conn, Routes.pasta_show_path(conn, :show, pasta))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Pasta"

      assert_patch(show_live, Routes.pasta_show_path(conn, :edit, pasta))

      assert show_live
             |> form("#pasta-form", pasta: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#pasta-form", pasta: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.pasta_show_path(conn, :show, pasta))

      assert html =~ "Pasta updated successfully"
      assert html =~ "some updated title"
    end
  end
end
