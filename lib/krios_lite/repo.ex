defmodule KriosLite.Repo do
  use Ecto.Repo,
    otp_app: :krios_lite,
    adapter: Ecto.Adapters.Postgres
end
