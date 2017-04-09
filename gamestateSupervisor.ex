defmodule GamestateSupervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link(__module__, [])
  end

  def init(_options) do
    children = [
      worker(Gamestate, [:main_gamestate]),
      worker(RestoreInfo, [:restore_info])
    ]

    supervise(children, strategy: :one_for_one)
  end

end
