defmodule Tailwindgen.Tsc12Test do
  use Tailwindgen.DataCase

  alias Tailwindgen.Tsc12

  describe "ts12s" do
    alias Tailwindgen.Tsc12.Ts12

    @valid_attrs %{age: 42, body: "some body", title: "some title"}
    @update_attrs %{age: 43, body: "some updated body", title: "some updated title"}
    @invalid_attrs %{age: nil, body: nil, title: nil}

    def ts12_fixture(attrs \\ %{}) do
      {:ok, ts12} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Tsc12.create_ts12()

      ts12
    end

    test "list_ts12s/0 returns all ts12s" do
      ts12 = ts12_fixture()
      assert Tsc12.list_ts12s() == [ts12]
    end

    test "get_ts12!/1 returns the ts12 with given id" do
      ts12 = ts12_fixture()
      assert Tsc12.get_ts12!(ts12.id) == ts12
    end

    test "create_ts12/1 with valid data creates a ts12" do
      assert {:ok, %Ts12{} = ts12} = Tsc12.create_ts12(@valid_attrs)
      assert ts12.age == 42
      assert ts12.body == "some body"
      assert ts12.title == "some title"
    end

    test "create_ts12/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tsc12.create_ts12(@invalid_attrs)
    end

    test "update_ts12/2 with valid data updates the ts12" do
      ts12 = ts12_fixture()
      assert {:ok, %Ts12{} = ts12} = Tsc12.update_ts12(ts12, @update_attrs)
      assert ts12.age == 43
      assert ts12.body == "some updated body"
      assert ts12.title == "some updated title"
    end

    test "update_ts12/2 with invalid data returns error changeset" do
      ts12 = ts12_fixture()
      assert {:error, %Ecto.Changeset{}} = Tsc12.update_ts12(ts12, @invalid_attrs)
      assert ts12 == Tsc12.get_ts12!(ts12.id)
    end

    test "delete_ts12/1 deletes the ts12" do
      ts12 = ts12_fixture()
      assert {:ok, %Ts12{}} = Tsc12.delete_ts12(ts12)
      assert_raise Ecto.NoResultsError, fn -> Tsc12.get_ts12!(ts12.id) end
    end

    test "change_ts12/1 returns a ts12 changeset" do
      ts12 = ts12_fixture()
      assert %Ecto.Changeset{} = Tsc12.change_ts12(ts12)
    end
  end
end
