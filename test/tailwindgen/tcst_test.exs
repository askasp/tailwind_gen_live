defmodule Tailwindgen.TcstTest do
  use Tailwindgen.DataCase

  alias Tailwindgen.Tcst

  describe "postvsxtitle" do
    alias Tailwindgen.Tcst.Postx

    @valid_attrs %{body: "some body"}
    @update_attrs %{body: "some updated body"}
    @invalid_attrs %{body: nil}

    def postx_fixture(attrs \\ %{}) do
      {:ok, postx} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Tcst.create_postx()

      postx
    end

    test "list_postvsxtitle/0 returns all postvsxtitle" do
      postx = postx_fixture()
      assert Tcst.list_postvsxtitle() == [postx]
    end

    test "get_postx!/1 returns the postx with given id" do
      postx = postx_fixture()
      assert Tcst.get_postx!(postx.id) == postx
    end

    test "create_postx/1 with valid data creates a postx" do
      assert {:ok, %Postx{} = postx} = Tcst.create_postx(@valid_attrs)
      assert postx.body == "some body"
    end

    test "create_postx/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tcst.create_postx(@invalid_attrs)
    end

    test "update_postx/2 with valid data updates the postx" do
      postx = postx_fixture()
      assert {:ok, %Postx{} = postx} = Tcst.update_postx(postx, @update_attrs)
      assert postx.body == "some updated body"
    end

    test "update_postx/2 with invalid data returns error changeset" do
      postx = postx_fixture()
      assert {:error, %Ecto.Changeset{}} = Tcst.update_postx(postx, @invalid_attrs)
      assert postx == Tcst.get_postx!(postx.id)
    end

    test "delete_postx/1 deletes the postx" do
      postx = postx_fixture()
      assert {:ok, %Postx{}} = Tcst.delete_postx(postx)
      assert_raise Ecto.NoResultsError, fn -> Tcst.get_postx!(postx.id) end
    end

    test "change_postx/1 returns a postx changeset" do
      postx = postx_fixture()
      assert %Ecto.Changeset{} = Tcst.change_postx(postx)
    end
  end
end
