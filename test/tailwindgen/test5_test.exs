defmodule Tailwindgen.Test5Test do
  use Tailwindgen.DataCase

  alias Tailwindgen.Test5

  describe "postfems" do
    alias Tailwindgen.Test5.Postfem

    @valid_attrs %{body: "some body", title: "some title"}
    @update_attrs %{body: "some updated body", title: "some updated title"}
    @invalid_attrs %{body: nil, title: nil}

    def postfem_fixture(attrs \\ %{}) do
      {:ok, postfem} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Test5.create_postfem()

      postfem
    end

    test "list_postfems/0 returns all postfems" do
      postfem = postfem_fixture()
      assert Test5.list_postfems() == [postfem]
    end

    test "get_postfem!/1 returns the postfem with given id" do
      postfem = postfem_fixture()
      assert Test5.get_postfem!(postfem.id) == postfem
    end

    test "create_postfem/1 with valid data creates a postfem" do
      assert {:ok, %Postfem{} = postfem} = Test5.create_postfem(@valid_attrs)
      assert postfem.body == "some body"
      assert postfem.title == "some title"
    end

    test "create_postfem/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Test5.create_postfem(@invalid_attrs)
    end

    test "update_postfem/2 with valid data updates the postfem" do
      postfem = postfem_fixture()
      assert {:ok, %Postfem{} = postfem} = Test5.update_postfem(postfem, @update_attrs)
      assert postfem.body == "some updated body"
      assert postfem.title == "some updated title"
    end

    test "update_postfem/2 with invalid data returns error changeset" do
      postfem = postfem_fixture()
      assert {:error, %Ecto.Changeset{}} = Test5.update_postfem(postfem, @invalid_attrs)
      assert postfem == Test5.get_postfem!(postfem.id)
    end

    test "delete_postfem/1 deletes the postfem" do
      postfem = postfem_fixture()
      assert {:ok, %Postfem{}} = Test5.delete_postfem(postfem)
      assert_raise Ecto.NoResultsError, fn -> Test5.get_postfem!(postfem.id) end
    end

    test "change_postfem/1 returns a postfem changeset" do
      postfem = postfem_fixture()
      assert %Ecto.Changeset{} = Test5.change_postfem(postfem)
    end
  end
end
