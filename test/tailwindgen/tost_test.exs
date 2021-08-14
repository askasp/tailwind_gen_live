defmodule Tailwindgen.TostTest do
  use Tailwindgen.DataCase

  alias Tailwindgen.Tost

  describe "postos" do
    alias Tailwindgen.Tost.Posto

    @valid_attrs %{body: "some body", title: "some title"}
    @update_attrs %{body: "some updated body", title: "some updated title"}
    @invalid_attrs %{body: nil, title: nil}

    def posto_fixture(attrs \\ %{}) do
      {:ok, posto} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Tost.create_posto()

      posto
    end

    test "list_postos/0 returns all postos" do
      posto = posto_fixture()
      assert Tost.list_postos() == [posto]
    end

    test "get_posto!/1 returns the posto with given id" do
      posto = posto_fixture()
      assert Tost.get_posto!(posto.id) == posto
    end

    test "create_posto/1 with valid data creates a posto" do
      assert {:ok, %Posto{} = posto} = Tost.create_posto(@valid_attrs)
      assert posto.body == "some body"
      assert posto.title == "some title"
    end

    test "create_posto/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tost.create_posto(@invalid_attrs)
    end

    test "update_posto/2 with valid data updates the posto" do
      posto = posto_fixture()
      assert {:ok, %Posto{} = posto} = Tost.update_posto(posto, @update_attrs)
      assert posto.body == "some updated body"
      assert posto.title == "some updated title"
    end

    test "update_posto/2 with invalid data returns error changeset" do
      posto = posto_fixture()
      assert {:error, %Ecto.Changeset{}} = Tost.update_posto(posto, @invalid_attrs)
      assert posto == Tost.get_posto!(posto.id)
    end

    test "delete_posto/1 deletes the posto" do
      posto = posto_fixture()
      assert {:ok, %Posto{}} = Tost.delete_posto(posto)
      assert_raise Ecto.NoResultsError, fn -> Tost.get_posto!(posto.id) end
    end

    test "change_posto/1 returns a posto changeset" do
      posto = posto_fixture()
      assert %Ecto.Changeset{} = Tost.change_posto(posto)
    end
  end
end
