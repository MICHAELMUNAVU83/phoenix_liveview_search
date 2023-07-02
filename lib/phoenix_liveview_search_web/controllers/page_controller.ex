defmodule PhoenixLiveviewSearchWeb.PageController do
  use PhoenixLiveviewSearchWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
