defmodule PhoenixLiveviewSearchWeb.CardView do
  use PhoenixLiveviewSearchWeb, :view
  alias PhoenixLiveviewSearchWeb.CardView

  def render("index.json", %{cards: cards}) do
    %{data: render_many(cards, CardView, "card.json")}
  end

  def render("show.json", %{card: card}) do
    %{data: render_one(card, CardView, "card.json")}
  end

  def render("card.json", %{card: card}) do
    %{
      id: card.id,
      name: card.name,
      body: card.body
    }
  end
end