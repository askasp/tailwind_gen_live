defmodule TailwindgenWeb.PosttreLiveTest do
  use TailwindgenWeb.ConnCase

  import Phoenix.LiveViewTest

  alias Tailwindgen.Test3

  @create_attrs %{body: "some body", title: "some title"}
  @update_attrs %{body: "some updated body", title: "some updated title"}
  @invalid_attrs %{body: nil, title: nil}

  defp fixture(:posttre) do
    {:ok, posttre} = Test3.create_posttre(@create_attrs)
    posttre
  end

  defp create_posttre(_) do
    posttre = fixture(:posttre)
    %{posttre: posttre}
  end

  describe "Index" do
    setup [:create_posttre]

    test "lists all posttre", %{conn: conn, posttre: posttre} do
      {:ok, _index_live, html} = live(conn, Routes.posttre_index_path(conn, :index))

      assert html =~ "Listing Posttre"
      assert html =~ posttre.body
    end

    test "saves new posttre", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.posttre_index_path(conn, :index))

      assert index_live |> element("a", "New Posttre") |> render_click() =~
               "New Posttre"

      assert_patch(index_live, Routes.posttre_index_path(conn, :new))

      assert index_live
             |> form("#posttre-form", posttre: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#posttre-form", posttre: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.posttre_index_path(conn, :index))

      assert html =~ "Posttre created successfully"
      assert html =~ "some body"
    end

    test "updates posttre in listing", %{conn: conn, posttre: posttre} do
      {:ok, index_live, _html} = live(conn, Routes.posttre_index_path(conn, :index))

      assert index_live |> element("#posttre-#{posttre.id} a", "Edit") |> render_click() =~
               "Edit Posttre"

      assert_patch(index_live, Routes.posttre_index_path(conn, :edit, posttre))

      assert index_live
             |> form("#posttre-form", posttre: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#posttre-form", posttre: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.posttre_index_path(conn, :index))

      assert html =~ "Posttre updated successfully"
      assert html =~ "some updated body"
    end

    test "deletes posttre in listing", %{conn: conn, posttre: posttre} do
      {:ok, index_live, _html} = live(conn, Routes.posttre_index_path(conn, :index))

      assert index_live |> element("#posttre-#{posttre.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#posttre-#{posttre.id}")
    end
  end

  describe "Show" do
    setup [:create_posttre]

    test "displays posttre", %{conn: conn, posttre: posttre} do
      {:ok, _show_live, html} = live(conn, Routes.posttre_show_path(conn, :show, posttre))

      assert html =~ "Show Posttre"
      assert html =~ posttre.body
    end

    test "updates posttre within modal", %{conn: conn, posttre: posttre} do
      {:ok, show_live, _html} = live(conn, Routes.posttre_show_path(conn, :show, posttre))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Posttre"

      assert_patch(show_live, Routes.posttre_show_path(conn, :edit, posttre))

      assert show_live
             |> form("#posttre-form", posttre: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#posttre-form", posttre: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.posttre_show_path(conn, :show, posttre))

      assert html =~ "Posttre updated successfully"
      assert html =~ "some updated body"
    end
  end
end
