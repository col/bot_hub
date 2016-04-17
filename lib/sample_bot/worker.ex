defmodule SampleBot.Worker do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, "SampleBot")
  end

  def init(name) do
    :global.register_name(name, self)
    {:ok, []}
  end

  def handle_cast({:handle_message, message}, state) do
    IO.puts "SampleBot - Received message: #{message}"
    {:noreply, state}
  end

end
