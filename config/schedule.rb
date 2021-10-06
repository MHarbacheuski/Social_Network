# frozen_string_literal: true

set :output, 'log/cron.log'

every 1.minute do
  rake 'message:send_message'
end
