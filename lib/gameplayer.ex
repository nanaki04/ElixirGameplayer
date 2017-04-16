defmodule Gameplayer do
  use Supervisor

  def start_game(game_id, config \\ []) do
    start_supervising game_id, config
  end

  def stop_game(gameplayer) do
    Supervisor.terminate_child(gameplayer, :main_gamestate)
    Supervisor.stop(gameplayer, :normal)
  end

  def init([game_id, config]) do
    gamestate_mod = config[:gamestate]

    children = [
      worker(gamestate_mod, [game_id, config, [name: game_id]])
    ]

    supervise(children, strategy: :one_for_one)
  end

  defp start_supervising(game_id, config) do
    Supervisor.start_link(__MODULE__, [game_id, config])
  end

end
