# frozen_string_literal: true

set :output, 'log/cron.log'

every 2.minute do
  rake 'sample:test'
end
