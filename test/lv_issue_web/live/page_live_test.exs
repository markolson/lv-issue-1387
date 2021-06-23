defmodule LvIssueWeb.PageLiveTest do
  use LvIssueWeb.ConnCase

  import Phoenix.LiveViewTest

  test "it has a diffing error", %{conn: conn} do
    {:ok, view, _disconnected_html} = live(conn, "/")

    assert view |> render() =~ "Above"

    send(view.pid, "set-list")

    assert view |> render() =~ "test-three"

    send(view.pid, "clear-list")

    # This is never reached.
    refute view |> render() =~ "test-three"
  end
end
