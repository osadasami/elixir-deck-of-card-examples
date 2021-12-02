defmodule ElixirCardsTest do
  use ExUnit.Case
  doctest ElixirCards

  test "greets the world" do
    assert ElixirCards.hello() == :world
  end

  test "deck returns 20 cards" do
    assert length(ElixirCards.deck()) == 20
  end

  test "shuffle randomize deck" do
    deck = ElixirCards.deck()
    refute deck == ElixirCards.shuffle(deck)
  end
end
