defmodule BotHub.Bot do

  def handle_message({bot_name, message}) do
    handle_message(find_bot(bot_name), message)
  end

  defp handle_message(:undefined, _) do
    :bot_not_found
  end

  defp handle_message(bot, message) do
    GenServer.cast(bot, {:handle_message, message})
  end

  def find_bot(name) do
    :global.whereis_name(name)
  end

end
