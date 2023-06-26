defmodule Hl7Liveview.Repo do
  use Ecto.Repo,
    otp_app: :hl7_liveview,
    adapter: Ecto.Adapters.Postgres
end
