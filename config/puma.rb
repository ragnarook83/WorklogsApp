# frozen_string_literal: true

max_threads_count = ENV.fetch('RAILS_MAX_THREADS', 2)
min_threads_count = ENV.fetch('RAILS_MIN_THREADS', 2)
threads min_threads_count, max_threads_count

worker_timeout 3600 if ENV.fetch('RAILS_ENV', 'development') == 'development'
port ENV.fetch('PORT', 3000)

environment ENV.fetch('RAILS_ENV', 'development')
pidfile ENV.fetch('PIDFILE', 'tmp/pids/server.pid')
workers ENV.fetch('WEB_CONCURRENCY', 2)

preload_app!

on_worker_boot do
  ActiveRecord::Base.establish_connection
end

plugin :tmp_restart
