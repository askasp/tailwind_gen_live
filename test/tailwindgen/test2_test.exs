defmodule Tailwindgen.Test2Test do
  use Tailwindgen.DataCase

  alias Tailwindgen.Test2

  describe "poststo" do
    alias Tailwindgen.Test2.Postto

    @valid_attrs %{body: "some body", title: "some title"}
    @update_attrs %{body: "some updated body", title: "some updated title"}
    @invalid_attrs %{body: nil, title: nil}

    def postto_fixture(attrs \\ %{}) do
      {:ok, postto} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Test2.create_postto()

      postto
    end

    test "list_poststo/0 returns all poststo" do
      postto = postto_fixture()
      assert Test2.list_poststo() == [postto]
    end

    test "get_postto!/1 returns the postto with given id" do
      postto = postto_fixture()
      assert Test2.get_postto!(postto.id) == postto
    end

    test "create_postto/1 with valid data creates a postto" do
      assert {:ok, %Postto{} = postto} = Test2.create_postto(@valid_attrs)
      assert postto.body == "some body"
      assert postto.title == "some title"
    end

    test "create_postto/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Test2.create_postto(@invalid_attrs)
    end

    test "update_postto/2 with valid data updates the postto" do
      postto = postto_fixture()
      assert {:ok, %Postto{} = postto} = Test2.update_postto(postto, @update_attrs)
      assert postto.body == "some updated body"
      assert postto.title == "some updated title"
    end

    test "update_postto/2 with invalid data returns error changeset" do
      postto = postto_fixture()
      assert {:error, %Ecto.Changeset{}} = Test2.update_postto(postto, @invalid_attrs)
      assert postto == Test2.get_postto!(postto.id)
    end

    test "delete_postto/1 deletes the postto" do
      postto = postto_fixture()
      assert {:ok, %Postto{}} = Test2.delete_postto(postto)
      assert_raise Ecto.NoResultsError, fn -> Test2.get_postto!(postto.id) end
    end

    test "change_postto/1 returns a postto changeset" do
      postto = postto_fixture()
      assert %Ecto.Changeset{} = Test2.change_postto(postto)
    end
  end
end
