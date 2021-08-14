defmodule Tailwindgen.TgstTest do
  use Tailwindgen.DataCase

  alias Tailwindgen.Tgst

  describe "postes" do
    alias Tailwindgen.Tgst.Poste

    @valid_attrs %{body: "some body", title: "some title"}
    @update_attrs %{body: "some updated body", title: "some updated title"}
    @invalid_attrs %{body: nil, title: nil}

    def poste_fixture(attrs \\ %{}) do
      {:ok, poste} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Tgst.create_poste()

      poste
    end

    test "list_postes/0 returns all postes" do
      poste = poste_fixture()
      assert Tgst.list_postes() == [poste]
    end

    test "get_poste!/1 returns the poste with given id" do
      poste = poste_fixture()
      assert Tgst.get_poste!(poste.id) == poste
    end

    test "create_poste/1 with valid data creates a poste" do
      assert {:ok, %Poste{} = poste} = Tgst.create_poste(@valid_attrs)
      assert poste.body == "some body"
      assert poste.title == "some title"
    end

    test "create_poste/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tgst.create_poste(@invalid_attrs)
    end

    test "update_poste/2 with valid data updates the poste" do
      poste = poste_fixture()
      assert {:ok, %Poste{} = poste} = Tgst.update_poste(poste, @update_attrs)
      assert poste.body == "some updated body"
      assert poste.title == "some updated title"
    end

    test "update_poste/2 with invalid data returns error changeset" do
      poste = poste_fixture()
      assert {:error, %Ecto.Changeset{}} = Tgst.update_poste(poste, @invalid_attrs)
      assert poste == Tgst.get_poste!(poste.id)
    end

    test "delete_poste/1 deletes the poste" do
      poste = poste_fixture()
      assert {:ok, %Poste{}} = Tgst.delete_poste(poste)
      assert_raise Ecto.NoResultsError, fn -> Tgst.get_poste!(poste.id) end
    end

    test "change_poste/1 returns a poste changeset" do
      poste = poste_fixture()
      assert %Ecto.Changeset{} = Tgst.change_poste(poste)
    end
  end
end
