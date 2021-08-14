defmodule Tailwindgen.Test3Test do
  use Tailwindgen.DataCase

  alias Tailwindgen.Test3

  describe "posttre" do
    alias Tailwindgen.Test3.Posttre

    @valid_attrs %{body: "some body", title: "some title"}
    @update_attrs %{body: "some updated body", title: "some updated title"}
    @invalid_attrs %{body: nil, title: nil}

    def posttre_fixture(attrs \\ %{}) do
      {:ok, posttre} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Test3.create_posttre()

      posttre
    end

    test "list_posttre/0 returns all posttre" do
      posttre = posttre_fixture()
      assert Test3.list_posttre() == [posttre]
    end

    test "get_posttre!/1 returns the posttre with given id" do
      posttre = posttre_fixture()
      assert Test3.get_posttre!(posttre.id) == posttre
    end

    test "create_posttre/1 with valid data creates a posttre" do
      assert {:ok, %Posttre{} = posttre} = Test3.create_posttre(@valid_attrs)
      assert posttre.body == "some body"
      assert posttre.title == "some title"
    end

    test "create_posttre/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Test3.create_posttre(@invalid_attrs)
    end

    test "update_posttre/2 with valid data updates the posttre" do
      posttre = posttre_fixture()
      assert {:ok, %Posttre{} = posttre} = Test3.update_posttre(posttre, @update_attrs)
      assert posttre.body == "some updated body"
      assert posttre.title == "some updated title"
    end

    test "update_posttre/2 with invalid data returns error changeset" do
      posttre = posttre_fixture()
      assert {:error, %Ecto.Changeset{}} = Test3.update_posttre(posttre, @invalid_attrs)
      assert posttre == Test3.get_posttre!(posttre.id)
    end

    test "delete_posttre/1 deletes the posttre" do
      posttre = posttre_fixture()
      assert {:ok, %Posttre{}} = Test3.delete_posttre(posttre)
      assert_raise Ecto.NoResultsError, fn -> Test3.get_posttre!(posttre.id) end
    end

    test "change_posttre/1 returns a posttre changeset" do
      posttre = posttre_fixture()
      assert %Ecto.Changeset{} = Test3.change_posttre(posttre)
    end
  end
end
