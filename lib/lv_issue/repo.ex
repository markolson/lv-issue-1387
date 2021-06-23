defmodule LvIssue.Repo do
  use Ecto.Repo,
    otp_app: :lv_issue,
    adapter: Ecto.Adapters.Postgres
end
