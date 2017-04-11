defmodule Gameplayer do
  use Supervisor

  def start_game(game_id, options \\ []) do
    options = handle_options options
    start_supervising game_id, options
  end

  def stop_game(gameplayer) do
    Supervisor.terminate_child(gameplayer, :main_gamestate)
    Supervisor.stop(gameplayer, :normal)
  end

  def init([game_id, options]) do
    game_state = options.game_state

    children = [
      worker(game_state, [name: game_state, game_id: game_id, options: options])
    ]

    supervise(children, strategy: :one_for_one)
  end

  defp start_supervising(game_id, options) do
    Supervisor.start_link(__MODULE__, [game_id, options])
  end

  defp handle_options(options) do
    Enum.into(options, %{
      game_state: Mock.Gamestate
    })
  end

end
