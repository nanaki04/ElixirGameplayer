defmodule Gameplayer do

  def play_map(map) do

  end

  def resume_map(savedGameId) do

  end

  defp get_map_master_data(map) do
    Masterdata.get_gamedata(map)
  end

end
