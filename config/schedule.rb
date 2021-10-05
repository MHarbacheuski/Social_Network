# frozen_string_literal: true

set :output, 'log/cron.log'

every 10.minute do
  rake 'sample:test'
end
