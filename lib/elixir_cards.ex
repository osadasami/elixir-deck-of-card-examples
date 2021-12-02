defmodule ElixirCards do
  @moduledoc """
  Provides functions to manipulate on deck of cards
  """

  @doc """
  Hello world.

  ## Examples

      iex> ElixirCards.hello()
      :world

  """
  def hello do
    :world
  end

  @doc """
  Creates deck of cards

  ## Example

      iex> ElixirCards.deck
      ["Ace of Spades", "Ace of Clubs", "Ace of Hearts", "Ace of Diamonds",
      "Two of Spades", "Two of Clubs", "Two of Hearts", "Two of Diamonds",
      "Three of Spades", "Three of Clubs", "Three of Hearts", "Three of Diamonds",
      "Four of Spades", "Four of Clubs", "Four of Hearts", "Four of Diamonds",
      "Five of Spades", "Five of Clubs", "Five of Hearts", "Five of Diamonds"]
  """
  def deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for value <- values, suit <- suits do
      "#{value} of #{suit}"
    end
  end

  @doc """
  Shuffle the deck of cards

  ## Example
      iex> ElixirCards.deck |> ElixirCards.shuffle
  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
  Determines whether a deck contains a given card

  ## Examples
      iex> deck = ElixirCards.deck
      iex> ElixirCards.contains?(deck, "Ace of Spades")
      true
      iex> ElixirCards.contains?(deck, "None")
      false
  """
  def contains?(deck, item) do
    Enum.member?(deck, item)
  end

  def deal(deck, size) do
    Enum.split(deck, size)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _} -> "That file does not exist"
    end
  end

  def hand(size) do
    deck() |> shuffle() |> deal(size)
  end
end
