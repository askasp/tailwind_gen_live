defmodule Tailwindgen.Test4Test do
  use Tailwindgen.DataCase

  alias Tailwindgen.Test4

  describe "postfire" do
    alias Tailwindgen.Test4.Postfire

    @valid_attrs %{body: "some body", title: "some title"}
    @update_attrs %{body: "some updated body", title: "some updated title"}
    @invalid_attrs %{body: nil, title: nil}

    def postfire_fixture(attrs \\ %{}) do
      {:ok, postfire} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Test4.create_postfire()

      postfire
    end

    test "list_postfire/0 returns all postfire" do
      postfire = postfire_fixture()
      assert Test4.list_postfire() == [postfire]
    end

    test "get_postfire!/1 returns the postfire with given id" do
      postfire = postfire_fixture()
      assert Test4.get_postfire!(postfire.id) == postfire
    end

    test "create_postfire/1 with valid data creates a postfire" do
      assert {:ok, %Postfire{} = postfire} = Test4.create_postfire(@valid_attrs)
      assert postfire.body == "some body"
      assert postfire.title == "some title"
    end

    test "create_postfire/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Test4.create_postfire(@invalid_attrs)
    end

    test "update_postfire/2 with valid data updates the postfire" do
      postfire = postfire_fixture()
      assert {:ok, %Postfire{} = postfire} = Test4.update_postfire(postfire, @update_attrs)
      assert postfire.body == "some updated body"
      assert postfire.title == "some updated title"
    end

    test "update_postfire/2 with invalid data returns error changeset" do
      postfire = postfire_fixture()
      assert {:error, %Ecto.Changeset{}} = Test4.update_postfire(postfire, @invalid_attrs)
      assert postfire == Test4.get_postfire!(postfire.id)
    end

    test "delete_postfire/1 deletes the postfire" do
      postfire = postfire_fixture()
      assert {:ok, %Postfire{}} = Test4.delete_postfire(postfire)
      assert_raise Ecto.NoResultsError, fn -> Test4.get_postfire!(postfire.id) end
    end

    test "change_postfire/1 returns a postfire changeset" do
      postfire = postfire_fixture()
      assert %Ecto.Changeset{} = Test4.change_postfire(postfire)
    end
  end
end
