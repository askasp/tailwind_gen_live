defmodule Tailwindgen.TustTest do
  use Tailwindgen.DataCase

  alias Tailwindgen.Tust

  describe "postus" do
    alias Tailwindgen.Tust.Postu

    @valid_attrs %{body: "some body", title: "some title"}
    @update_attrs %{body: "some updated body", title: "some updated title"}
    @invalid_attrs %{body: nil, title: nil}

    def postu_fixture(attrs \\ %{}) do
      {:ok, postu} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Tust.create_postu()

      postu
    end

    test "list_postus/0 returns all postus" do
      postu = postu_fixture()
      assert Tust.list_postus() == [postu]
    end

    test "get_postu!/1 returns the postu with given id" do
      postu = postu_fixture()
      assert Tust.get_postu!(postu.id) == postu
    end

    test "create_postu/1 with valid data creates a postu" do
      assert {:ok, %Postu{} = postu} = Tust.create_postu(@valid_attrs)
      assert postu.body == "some body"
      assert postu.title == "some title"
    end

    test "create_postu/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tust.create_postu(@invalid_attrs)
    end

    test "update_postu/2 with valid data updates the postu" do
      postu = postu_fixture()
      assert {:ok, %Postu{} = postu} = Tust.update_postu(postu, @update_attrs)
      assert postu.body == "some updated body"
      assert postu.title == "some updated title"
    end

    test "update_postu/2 with invalid data returns error changeset" do
      postu = postu_fixture()
      assert {:error, %Ecto.Changeset{}} = Tust.update_postu(postu, @invalid_attrs)
      assert postu == Tust.get_postu!(postu.id)
    end

    test "delete_postu/1 deletes the postu" do
      postu = postu_fixture()
      assert {:ok, %Postu{}} = Tust.delete_postu(postu)
      assert_raise Ecto.NoResultsError, fn -> Tust.get_postu!(postu.id) end
    end

    test "change_postu/1 returns a postu changeset" do
      postu = postu_fixture()
      assert %Ecto.Changeset{} = Tust.change_postu(postu)
    end
  end
end
