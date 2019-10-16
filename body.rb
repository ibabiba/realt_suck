require 'telegram/bot'
require 'psych'

token = Psych.load(IO.read('creds.yaml'))["apitoken"]

loop do
  begin
    Telegram::Bot::Client.run(token) do |bot|
      bot.listen do |rqst|
        Thread.start(rqst) do |rqst|
          begin
            case rqst.text
            when '/start'
              bot.api.send_message(chat_id: rqst.chat.id, text: "REALT SUCK!, #{rqst.from.first_name}")
            when '/stop'
              bot.api.send_message(chat_id: rqst.chat.id, text: "REALT SUCK!, #{rqst.from.first_name}")
            end
          rescue => e
            puts "Something went wrong #{e.message}"
          end
        end
      end
    end
  rescue
  end
end
