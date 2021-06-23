defmodule LvIssueWeb.PageLive do
  use LvIssueWeb, :live_view

  @impl true
  def render(%{items: []} = assigns) do
    ~L"""
      <%= "This string is Above some_helper" %>
      <%= some_helper(assigns) %>
    """
  end

  def render(assigns) do
    ~L"""
      <%= some_helper(assigns) %>
      <%= for item <- @items do %>
        <%= item %>
      <% end %>
    """
  end

  defp some_helper(assigns) do
    ~L"""
      Static Content
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, items: ["one", "two", "three"])}
  end

  @impl true
  def handle_info("clear-list", socket) do
    {:noreply, assign(socket, items: [])}
  end
end
