app_path = File.expand_path( File.join(File.dirname(__FILE__), '..', '..'))
worker_processes   1
timeout            180
listen             "#{app_path}/shared/tmp/sockets/unicorn.sock"
pid                "#{app_path}/shared/tmp/pids/unicorn.pid"
stderr_path        "log/unicorn.log"
stdout_path        "log/unicorn.log"

before_fork do |server, worker|
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.connection.disconnect!
  end

  old_pid = "#{server.config[:pid]}.oldbin"
  if File.exists?(old_pid) && server.pid != old_pid
    begin
      Process.kill("QUIT", File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      # someone else did our job for us
    end
  end
end

after_fork do |server, worker|
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.establish_connection
  end
end

before_exec do |server|
  ENV["BUNDLE_GEMFILE"] = "#{app_path}/current/Gemfile"
end
