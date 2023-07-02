defmodule PhoenixLiveviewSearch.Products.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :name, :string
    field :price, :integer
    field :quantity, :integer

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :price, :quantity])
    |> validate_required([:name, :price, :quantity])
  end
end
