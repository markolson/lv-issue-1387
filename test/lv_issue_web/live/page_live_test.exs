defmodule LvIssueWeb.PageLiveTest do
  use LvIssueWeb.ConnCase

  import Phoenix.LiveViewTest

  test "it has a diffing error", %{conn: conn} do
    {:ok, view, _disconnected_html} = live(conn, "/")

    assert view |> render() =~ "three"

    send(view.pid, "clear-list")

    assert view |> render() =~ "Above"
  end
end
