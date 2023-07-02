defmodule PhoenixLiveviewSearch.Repo do
  use Ecto.Repo,
    otp_app: :phoenix_liveview_search,
    adapter: Ecto.Adapters.MyXQL
end
