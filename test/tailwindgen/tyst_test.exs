defmodule Tailwindgen.TystTest do
  use Tailwindgen.DataCase

  alias Tailwindgen.Tyst

  describe "postys" do
    alias Tailwindgen.Tyst.Posty

    @valid_attrs %{body: "some body", title: "some title"}
    @update_attrs %{body: "some updated body", title: "some updated title"}
    @invalid_attrs %{body: nil, title: nil}

    def posty_fixture(attrs \\ %{}) do
      {:ok, posty} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Tyst.create_posty()

      posty
    end

    test "list_postys/0 returns all postys" do
      posty = posty_fixture()
      assert Tyst.list_postys() == [posty]
    end

    test "get_posty!/1 returns the posty with given id" do
      posty = posty_fixture()
      assert Tyst.get_posty!(posty.id) == posty
    end

    test "create_posty/1 with valid data creates a posty" do
      assert {:ok, %Posty{} = posty} = Tyst.create_posty(@valid_attrs)
      assert posty.body == "some body"
      assert posty.title == "some title"
    end

    test "create_posty/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tyst.create_posty(@invalid_attrs)
    end

    test "update_posty/2 with valid data updates the posty" do
      posty = posty_fixture()
      assert {:ok, %Posty{} = posty} = Tyst.update_posty(posty, @update_attrs)
      assert posty.body == "some updated body"
      assert posty.title == "some updated title"
    end

    test "update_posty/2 with invalid data returns error changeset" do
      posty = posty_fixture()
      assert {:error, %Ecto.Changeset{}} = Tyst.update_posty(posty, @invalid_attrs)
      assert posty == Tyst.get_posty!(posty.id)
    end

    test "delete_posty/1 deletes the posty" do
      posty = posty_fixture()
      assert {:ok, %Posty{}} = Tyst.delete_posty(posty)
      assert_raise Ecto.NoResultsError, fn -> Tyst.get_posty!(posty.id) end
    end

    test "change_posty/1 returns a posty changeset" do
      posty = posty_fixture()
      assert %Ecto.Changeset{} = Tyst.change_posty(posty)
    end
  end
end
