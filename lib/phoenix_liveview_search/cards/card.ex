defmodule PhoenixLiveviewSearch.Cards.Card do
  use Ecto.Schema
  import Ecto.Changeset

  schema "cards" do
    field :name, :string
    field :body, :string

    timestamps()
  end

  @doc false
  def changeset(card, attrs) do
    card
    |> cast(attrs, [:name, :body])
    |> validate_required([:name, :body])
  end
end
