defmodule PhoenixLiveviewSearch.CardsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PhoenixLiveviewSearch.Cards` context.
  """

  @doc """
  Generate a card.
  """
  def card_fixture(attrs \\ %{}) do
    {:ok, card} =
      attrs
      |> Enum.into(%{
        name: "some name",
        body: "some body"
      })
      |> PhoenixLiveviewSearch.Cards.create_card()

    card
  end
end
