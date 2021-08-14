defmodule Tailwindgen.Test8Test do
  use Tailwindgen.DataCase

  alias Tailwindgen.Test8

  describe "post8s" do
    alias Tailwindgen.Test8.Post8

    @valid_attrs %{body: "some body", title: "some title"}
    @update_attrs %{body: "some updated body", title: "some updated title"}
    @invalid_attrs %{body: nil, title: nil}

    def post8_fixture(attrs \\ %{}) do
      {:ok, post8} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Test8.create_post8()

      post8
    end

    test "list_post8s/0 returns all post8s" do
      post8 = post8_fixture()
      assert Test8.list_post8s() == [post8]
    end

    test "get_post8!/1 returns the post8 with given id" do
      post8 = post8_fixture()
      assert Test8.get_post8!(post8.id) == post8
    end

    test "create_post8/1 with valid data creates a post8" do
      assert {:ok, %Post8{} = post8} = Test8.create_post8(@valid_attrs)
      assert post8.body == "some body"
      assert post8.title == "some title"
    end

    test "create_post8/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Test8.create_post8(@invalid_attrs)
    end

    test "update_post8/2 with valid data updates the post8" do
      post8 = post8_fixture()
      assert {:ok, %Post8{} = post8} = Test8.update_post8(post8, @update_attrs)
      assert post8.body == "some updated body"
      assert post8.title == "some updated title"
    end

    test "update_post8/2 with invalid data returns error changeset" do
      post8 = post8_fixture()
      assert {:error, %Ecto.Changeset{}} = Test8.update_post8(post8, @invalid_attrs)
      assert post8 == Test8.get_post8!(post8.id)
    end

    test "delete_post8/1 deletes the post8" do
      post8 = post8_fixture()
      assert {:ok, %Post8{}} = Test8.delete_post8(post8)
      assert_raise Ecto.NoResultsError, fn -> Test8.get_post8!(post8.id) end
    end

    test "change_post8/1 returns a post8 changeset" do
      post8 = post8_fixture()
      assert %Ecto.Changeset{} = Test8.change_post8(post8)
    end
  end
end
