defmodule Tailwindgen.Tsc10Test do
  use Tailwindgen.DataCase

  alias Tailwindgen.Tsc10

  describe "ts10s" do
    alias Tailwindgen.Tsc10.Ts10

    @valid_attrs %{age: 42, body: "some body", title: "some title"}
    @update_attrs %{age: 43, body: "some updated body", title: "some updated title"}
    @invalid_attrs %{age: nil, body: nil, title: nil}

    def ts10_fixture(attrs \\ %{}) do
      {:ok, ts10} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Tsc10.create_ts10()

      ts10
    end

    test "list_ts10s/0 returns all ts10s" do
      ts10 = ts10_fixture()
      assert Tsc10.list_ts10s() == [ts10]
    end

    test "get_ts10!/1 returns the ts10 with given id" do
      ts10 = ts10_fixture()
      assert Tsc10.get_ts10!(ts10.id) == ts10
    end

    test "create_ts10/1 with valid data creates a ts10" do
      assert {:ok, %Ts10{} = ts10} = Tsc10.create_ts10(@valid_attrs)
      assert ts10.age == 42
      assert ts10.body == "some body"
      assert ts10.title == "some title"
    end

    test "create_ts10/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tsc10.create_ts10(@invalid_attrs)
    end

    test "update_ts10/2 with valid data updates the ts10" do
      ts10 = ts10_fixture()
      assert {:ok, %Ts10{} = ts10} = Tsc10.update_ts10(ts10, @update_attrs)
      assert ts10.age == 43
      assert ts10.body == "some updated body"
      assert ts10.title == "some updated title"
    end

    test "update_ts10/2 with invalid data returns error changeset" do
      ts10 = ts10_fixture()
      assert {:error, %Ecto.Changeset{}} = Tsc10.update_ts10(ts10, @invalid_attrs)
      assert ts10 == Tsc10.get_ts10!(ts10.id)
    end

    test "delete_ts10/1 deletes the ts10" do
      ts10 = ts10_fixture()
      assert {:ok, %Ts10{}} = Tsc10.delete_ts10(ts10)
      assert_raise Ecto.NoResultsError, fn -> Tsc10.get_ts10!(ts10.id) end
    end

    test "change_ts10/1 returns a ts10 changeset" do
      ts10 = ts10_fixture()
      assert %Ecto.Changeset{} = Tsc10.change_ts10(ts10)
    end
  end
end
