defmodule Tailwindgen.TastTest do
  use Tailwindgen.DataCase

  alias Tailwindgen.Tast

  describe "postas" do
    alias Tailwindgen.Tast.Posta

    @valid_attrs %{body: "some body", title: "some title"}
    @update_attrs %{body: "some updated body", title: "some updated title"}
    @invalid_attrs %{body: nil, title: nil}

    def posta_fixture(attrs \\ %{}) do
      {:ok, posta} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Tast.create_posta()

      posta
    end

    test "list_postas/0 returns all postas" do
      posta = posta_fixture()
      assert Tast.list_postas() == [posta]
    end

    test "get_posta!/1 returns the posta with given id" do
      posta = posta_fixture()
      assert Tast.get_posta!(posta.id) == posta
    end

    test "create_posta/1 with valid data creates a posta" do
      assert {:ok, %Posta{} = posta} = Tast.create_posta(@valid_attrs)
      assert posta.body == "some body"
      assert posta.title == "some title"
    end

    test "create_posta/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tast.create_posta(@invalid_attrs)
    end

    test "update_posta/2 with valid data updates the posta" do
      posta = posta_fixture()
      assert {:ok, %Posta{} = posta} = Tast.update_posta(posta, @update_attrs)
      assert posta.body == "some updated body"
      assert posta.title == "some updated title"
    end

    test "update_posta/2 with invalid data returns error changeset" do
      posta = posta_fixture()
      assert {:error, %Ecto.Changeset{}} = Tast.update_posta(posta, @invalid_attrs)
      assert posta == Tast.get_posta!(posta.id)
    end

    test "delete_posta/1 deletes the posta" do
      posta = posta_fixture()
      assert {:ok, %Posta{}} = Tast.delete_posta(posta)
      assert_raise Ecto.NoResultsError, fn -> Tast.get_posta!(posta.id) end
    end

    test "change_posta/1 returns a posta changeset" do
      posta = posta_fixture()
      assert %Ecto.Changeset{} = Tast.change_posta(posta)
    end
  end
end
