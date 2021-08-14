defmodule Tailwindgen.Test9Test do
  use Tailwindgen.DataCase

  alias Tailwindgen.Test9

  describe "post9s" do
    alias Tailwindgen.Test9.Post9

    @valid_attrs %{body: "some body", title: "some title"}
    @update_attrs %{body: "some updated body", title: "some updated title"}
    @invalid_attrs %{body: nil, title: nil}

    def post9_fixture(attrs \\ %{}) do
      {:ok, post9} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Test9.create_post9()

      post9
    end

    test "list_post9s/0 returns all post9s" do
      post9 = post9_fixture()
      assert Test9.list_post9s() == [post9]
    end

    test "get_post9!/1 returns the post9 with given id" do
      post9 = post9_fixture()
      assert Test9.get_post9!(post9.id) == post9
    end

    test "create_post9/1 with valid data creates a post9" do
      assert {:ok, %Post9{} = post9} = Test9.create_post9(@valid_attrs)
      assert post9.body == "some body"
      assert post9.title == "some title"
    end

    test "create_post9/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Test9.create_post9(@invalid_attrs)
    end

    test "update_post9/2 with valid data updates the post9" do
      post9 = post9_fixture()
      assert {:ok, %Post9{} = post9} = Test9.update_post9(post9, @update_attrs)
      assert post9.body == "some updated body"
      assert post9.title == "some updated title"
    end

    test "update_post9/2 with invalid data returns error changeset" do
      post9 = post9_fixture()
      assert {:error, %Ecto.Changeset{}} = Test9.update_post9(post9, @invalid_attrs)
      assert post9 == Test9.get_post9!(post9.id)
    end

    test "delete_post9/1 deletes the post9" do
      post9 = post9_fixture()
      assert {:ok, %Post9{}} = Test9.delete_post9(post9)
      assert_raise Ecto.NoResultsError, fn -> Test9.get_post9!(post9.id) end
    end

    test "change_post9/1 returns a post9 changeset" do
      post9 = post9_fixture()
      assert %Ecto.Changeset{} = Test9.change_post9(post9)
    end
  end
end
