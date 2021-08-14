defmodule Tailwindgen.Test7Test do
  use Tailwindgen.DataCase

  alias Tailwindgen.Test7

  describe "postsyvs" do
    alias Tailwindgen.Test7.Postsyv

    @valid_attrs %{body: "some body", title: "some title"}
    @update_attrs %{body: "some updated body", title: "some updated title"}
    @invalid_attrs %{body: nil, title: nil}

    def postsyv_fixture(attrs \\ %{}) do
      {:ok, postsyv} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Test7.create_postsyv()

      postsyv
    end

    test "list_postsyvs/0 returns all postsyvs" do
      postsyv = postsyv_fixture()
      assert Test7.list_postsyvs() == [postsyv]
    end

    test "get_postsyv!/1 returns the postsyv with given id" do
      postsyv = postsyv_fixture()
      assert Test7.get_postsyv!(postsyv.id) == postsyv
    end

    test "create_postsyv/1 with valid data creates a postsyv" do
      assert {:ok, %Postsyv{} = postsyv} = Test7.create_postsyv(@valid_attrs)
      assert postsyv.body == "some body"
      assert postsyv.title == "some title"
    end

    test "create_postsyv/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Test7.create_postsyv(@invalid_attrs)
    end

    test "update_postsyv/2 with valid data updates the postsyv" do
      postsyv = postsyv_fixture()
      assert {:ok, %Postsyv{} = postsyv} = Test7.update_postsyv(postsyv, @update_attrs)
      assert postsyv.body == "some updated body"
      assert postsyv.title == "some updated title"
    end

    test "update_postsyv/2 with invalid data returns error changeset" do
      postsyv = postsyv_fixture()
      assert {:error, %Ecto.Changeset{}} = Test7.update_postsyv(postsyv, @invalid_attrs)
      assert postsyv == Test7.get_postsyv!(postsyv.id)
    end

    test "delete_postsyv/1 deletes the postsyv" do
      postsyv = postsyv_fixture()
      assert {:ok, %Postsyv{}} = Test7.delete_postsyv(postsyv)
      assert_raise Ecto.NoResultsError, fn -> Test7.get_postsyv!(postsyv.id) end
    end

    test "change_postsyv/1 returns a postsyv changeset" do
      postsyv = postsyv_fixture()
      assert %Ecto.Changeset{} = Test7.change_postsyv(postsyv)
    end
  end
end
