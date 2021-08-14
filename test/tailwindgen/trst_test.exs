defmodule Tailwindgen.TrstTest do
  use Tailwindgen.DataCase

  alias Tailwindgen.Trst

  describe "postvs" do
    alias Tailwindgen.Trst.Postv

    @valid_attrs %{body: "some body", title: "some title"}
    @update_attrs %{body: "some updated body", title: "some updated title"}
    @invalid_attrs %{body: nil, title: nil}

    def postv_fixture(attrs \\ %{}) do
      {:ok, postv} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Trst.create_postv()

      postv
    end

    test "list_postvs/0 returns all postvs" do
      postv = postv_fixture()
      assert Trst.list_postvs() == [postv]
    end

    test "get_postv!/1 returns the postv with given id" do
      postv = postv_fixture()
      assert Trst.get_postv!(postv.id) == postv
    end

    test "create_postv/1 with valid data creates a postv" do
      assert {:ok, %Postv{} = postv} = Trst.create_postv(@valid_attrs)
      assert postv.body == "some body"
      assert postv.title == "some title"
    end

    test "create_postv/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Trst.create_postv(@invalid_attrs)
    end

    test "update_postv/2 with valid data updates the postv" do
      postv = postv_fixture()
      assert {:ok, %Postv{} = postv} = Trst.update_postv(postv, @update_attrs)
      assert postv.body == "some updated body"
      assert postv.title == "some updated title"
    end

    test "update_postv/2 with invalid data returns error changeset" do
      postv = postv_fixture()
      assert {:error, %Ecto.Changeset{}} = Trst.update_postv(postv, @invalid_attrs)
      assert postv == Trst.get_postv!(postv.id)
    end

    test "delete_postv/1 deletes the postv" do
      postv = postv_fixture()
      assert {:ok, %Postv{}} = Trst.delete_postv(postv)
      assert_raise Ecto.NoResultsError, fn -> Trst.get_postv!(postv.id) end
    end

    test "change_postv/1 returns a postv changeset" do
      postv = postv_fixture()
      assert %Ecto.Changeset{} = Trst.change_postv(postv)
    end
  end
end
