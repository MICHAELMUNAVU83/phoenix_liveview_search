defmodule PhoenixLiveviewSearchWeb.ProductLive.Index do
  use PhoenixLiveviewSearchWeb, :live_view

  alias PhoenixLiveviewSearch.Products
  alias PhoenixLiveviewSearch.Products.Product

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(:products, list_products())
     |> assign(:changeset, Products.change_product(%Product{}))}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Product")
    |> assign(:product, Products.get_product!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Product")
    |> assign(:product, %Product{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Products")
    |> assign(:product, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    product = Products.get_product!(id)
    {:ok, _} = Products.delete_product(product)

    {:noreply, assign(socket, :products, list_products())}
  end

  def handle_event("search", %{"product" => product_params}, socket) do
    IO.inspect(product_params["search"])

    {:noreply,
     socket
     |> put_flash(:info, "Searching")}
  end

  defp list_products do
    Products.list_products()
  end
end
