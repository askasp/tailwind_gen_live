defmodule TailwindgenWeb.Pasta9ControllerTest do
  use TailwindgenWeb.ConnCase

  alias Tailwindgen.Tcsat9

  @create_attrs %{age: 42, stuff: %{}, title: "some title"}
  @update_attrs %{age: 43, stuff: %{}, title: "some updated title"}
  @invalid_attrs %{age: nil, stuff: nil, title: nil}

  def fixture(:pasta9) do
    {:ok, pasta9} = Tcsat9.create_pasta9(@create_attrs)
    pasta9
  end

  describe "index" do
    test "lists all pasta9s", %{conn: conn} do
      conn = get(conn, Routes.pasta9_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Pasta9s"
    end
  end

  describe "new pasta9" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.pasta9_path(conn, :new))
      assert html_response(conn, 200) =~ "New Pasta9"
    end
  end

  describe "create pasta9" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.pasta9_path(conn, :create), pasta9: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.pasta9_path(conn, :show, id)

      conn = get(conn, Routes.pasta9_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Pasta9"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.pasta9_path(conn, :create), pasta9: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Pasta9"
    end
  end

  describe "edit pasta9" do
    setup [:create_pasta9]

    test "renders form for editing chosen pasta9", %{conn: conn, pasta9: pasta9} do
      conn = get(conn, Routes.pasta9_path(conn, :edit, pasta9))
      assert html_response(conn, 200) =~ "Edit Pasta9"
    end
  end

  describe "update pasta9" do
    setup [:create_pasta9]

    test "redirects when data is valid", %{conn: conn, pasta9: pasta9} do
      conn = put(conn, Routes.pasta9_path(conn, :update, pasta9), pasta9: @update_attrs)
      assert redirected_to(conn) == Routes.pasta9_path(conn, :show, pasta9)

      conn = get(conn, Routes.pasta9_path(conn, :show, pasta9))
      assert html_response(conn, 200) =~ "some updated title"
    end

    test "renders errors when data is invalid", %{conn: conn, pasta9: pasta9} do
      conn = put(conn, Routes.pasta9_path(conn, :update, pasta9), pasta9: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Pasta9"
    end
  end

  describe "delete pasta9" do
    setup [:create_pasta9]

    test "deletes chosen pasta9", %{conn: conn, pasta9: pasta9} do
      conn = delete(conn, Routes.pasta9_path(conn, :delete, pasta9))
      assert redirected_to(conn) == Routes.pasta9_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.pasta9_path(conn, :show, pasta9))
      end
    end
  end

  defp create_pasta9(_) do
    pasta9 = fixture(:pasta9)
    %{pasta9: pasta9}
  end
end
