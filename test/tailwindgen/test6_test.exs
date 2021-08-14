defmodule Tailwindgen.Test6Test do
  use Tailwindgen.DataCase

  alias Tailwindgen.Test6

  describe "postseks" do
    alias Tailwindgen.Test6.Postsek

    @valid_attrs %{body: "some body", title: "some title"}
    @update_attrs %{body: "some updated body", title: "some updated title"}
    @invalid_attrs %{body: nil, title: nil}

    def postsek_fixture(attrs \\ %{}) do
      {:ok, postsek} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Test6.create_postsek()

      postsek
    end

    test "list_postseks/0 returns all postseks" do
      postsek = postsek_fixture()
      assert Test6.list_postseks() == [postsek]
    end

    test "get_postsek!/1 returns the postsek with given id" do
      postsek = postsek_fixture()
      assert Test6.get_postsek!(postsek.id) == postsek
    end

    test "create_postsek/1 with valid data creates a postsek" do
      assert {:ok, %Postsek{} = postsek} = Test6.create_postsek(@valid_attrs)
      assert postsek.body == "some body"
      assert postsek.title == "some title"
    end

    test "create_postsek/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Test6.create_postsek(@invalid_attrs)
    end

    test "update_postsek/2 with valid data updates the postsek" do
      postsek = postsek_fixture()
      assert {:ok, %Postsek{} = postsek} = Test6.update_postsek(postsek, @update_attrs)
      assert postsek.body == "some updated body"
      assert postsek.title == "some updated title"
    end

    test "update_postsek/2 with invalid data returns error changeset" do
      postsek = postsek_fixture()
      assert {:error, %Ecto.Changeset{}} = Test6.update_postsek(postsek, @invalid_attrs)
      assert postsek == Test6.get_postsek!(postsek.id)
    end

    test "delete_postsek/1 deletes the postsek" do
      postsek = postsek_fixture()
      assert {:ok, %Postsek{}} = Test6.delete_postsek(postsek)
      assert_raise Ecto.NoResultsError, fn -> Test6.get_postsek!(postsek.id) end
    end

    test "change_postsek/1 returns a postsek changeset" do
      postsek = postsek_fixture()
      assert %Ecto.Changeset{} = Test6.change_postsek(postsek)
    end
  end
end
