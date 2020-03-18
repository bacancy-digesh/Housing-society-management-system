set :environment, 'development'
# frozen_string_literal: true

# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
set :output, { error: 'log/cron_error_log.log', standard: 'log/cron_log.log' }
set :bundle_command, '/usr/local/bin/bundle'

set :env_path,    '"/usr/share/rvm/rubies/ruby-2.6.3"'

# doesn't need modifications
# job_type :command, ":task :output"

job_type :rake, ' cd :path && PATH=:env_path:"$PATH" RAILS_ENV=:environment bin/rake :task --silent :output '
job_type :runner, %q( cd :path && PATH=:env_path:"$PATH" bin/rails runner -e :environment ':task' :output )
job_type :script, ' cd :path && PATH=:env_path:"$PATH" RAILS_ENV=:environment bundle exec bin/:task :output '
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#tput, "/path/to/my/cron_log.log"
#

every '0 0 29 * *'do
  # command "/usr/bin/some_great_command"
  #  
  runner "Member.monthly_mail"
  # rake "some:great:rake:task"
end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
