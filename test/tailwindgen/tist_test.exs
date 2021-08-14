defmodule Tailwindgen.TistTest do
  use Tailwindgen.DataCase

  alias Tailwindgen.Tist

  describe "postis" do
    alias Tailwindgen.Tist.Posti

    @valid_attrs %{body: "some body", title: "some title"}
    @update_attrs %{body: "some updated body", title: "some updated title"}
    @invalid_attrs %{body: nil, title: nil}

    def posti_fixture(attrs \\ %{}) do
      {:ok, posti} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Tist.create_posti()

      posti
    end

    test "list_postis/0 returns all postis" do
      posti = posti_fixture()
      assert Tist.list_postis() == [posti]
    end

    test "get_posti!/1 returns the posti with given id" do
      posti = posti_fixture()
      assert Tist.get_posti!(posti.id) == posti
    end

    test "create_posti/1 with valid data creates a posti" do
      assert {:ok, %Posti{} = posti} = Tist.create_posti(@valid_attrs)
      assert posti.body == "some body"
      assert posti.title == "some title"
    end

    test "create_posti/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tist.create_posti(@invalid_attrs)
    end

    test "update_posti/2 with valid data updates the posti" do
      posti = posti_fixture()
      assert {:ok, %Posti{} = posti} = Tist.update_posti(posti, @update_attrs)
      assert posti.body == "some updated body"
      assert posti.title == "some updated title"
    end

    test "update_posti/2 with invalid data returns error changeset" do
      posti = posti_fixture()
      assert {:error, %Ecto.Changeset{}} = Tist.update_posti(posti, @invalid_attrs)
      assert posti == Tist.get_posti!(posti.id)
    end

    test "delete_posti/1 deletes the posti" do
      posti = posti_fixture()
      assert {:ok, %Posti{}} = Tist.delete_posti(posti)
      assert_raise Ecto.NoResultsError, fn -> Tist.get_posti!(posti.id) end
    end

    test "change_posti/1 returns a posti changeset" do
      posti = posti_fixture()
      assert %Ecto.Changeset{} = Tist.change_posti(posti)
    end
  end
end
