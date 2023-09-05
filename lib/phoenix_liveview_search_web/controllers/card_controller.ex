defmodule PhoenixLiveviewSearchWeb.CardController do
  use PhoenixLiveviewSearchWeb, :controller

  alias PhoenixLiveviewSearch.Cards
  alias PhoenixLiveviewSearch.Cards.Card

  action_fallback PhoenixLiveviewSearchWeb.FallbackController

  def index(conn, _params) do
    cards = Cards.list_cards()
    render(conn, "index.json", cards: cards)
  end

  def create(conn, card_params) do
    IO.inspect(card_params["Body"])

    with {:ok, %Card{} = card} <- Cards.create_card(card_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.card_path(conn, :show, card))
      |> render("show.json", card: card)
    end
  end

  def show(conn, %{"id" => id}) do
    card = Cards.get_card!(id)
    render(conn, "show.json", card: card)
  end

  def update(conn, %{"id" => id, "card" => card_params}) do
    card = Cards.get_card!(id)

    with {:ok, %Card{} = card} <- Cards.update_card(card, card_params) do
      render(conn, "show.json", card: card)
    end
  end

  def delete(conn, %{"id" => id}) do
    card = Cards.get_card!(id)

    with {:ok, %Card{}} <- Cards.delete_card(card) do
      send_resp(conn, :no_content, "")
    end
  end
end