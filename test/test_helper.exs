ExUnit.start()

case BotHub.Bot.find_bot("SampleBot") do
  :undefined -> SampleBot.start(nil, nil)
  _ -> nil
end
