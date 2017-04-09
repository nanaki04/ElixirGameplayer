defmodule RestoreInfo do

  def start_link(name) do
    Agent.start_link(fn -> %{} end)
  end

  def set_save_data_id(saveDataId) do
    Agent.update(:restore_info, &Map.put(&1, :save_data_id, saveDataId))
  end

  def get_save_data_id do
    Agent.get(:restore_info, &Map.get(&1, :save_data_id))
  end)

end
