defmodule BotHub.Bot do

  def find_bot(name) do
    :global.whereis_name(name)
  end

  def handle_message({bot_name, message}) do
    handle_message(find_bot(bot_name), message)
  end

  def version(bot_name) do
    get_version(find_bot(bot_name))
  end

  defp handle_message(:undefined, _), do: :bot_not_found
  defp handle_message(bot, message) do
    GenServer.cast(bot, {:handle_message, message})
  end

  def get_version(:undefined), do: :bot_not_found
  def get_version(bot) do
    GenServer.call(bot, :version)
  end

end
