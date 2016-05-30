ENV['RAILS_ENV'] = 'production'
worker_processes 1  # количество воркер процессов
preload_app true
user('deployer','staff')  # здесь указываем пользователя и группу его
timeout 30 # таймаут работы приложения

@app = "/home/deployer/bloodbank"  # путь к размещенному приложению
listen "#{@app}/tmp/project_name.socket"  # путь где будет лежать открытый сокет
working_directory "#{@app}"
pid "#{@app}/tmp/project_name.pid"  # ключ инстанса запущенного сервера
stderr_path "#{@app}/log/unicorn.stderr.log"  # пути к логам unicorn'а
stdout_path "#{@app}/log/unicorn.stdout.log"

GC.respond_to?(:copy_on_write_friendly=) and GC.copy_on_write_friendly = true

before_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!
  old_pid = "#{server.config[:pid]}.oldbin"
  if File.exists?(old_pid) && server.pid != old_pid
    begin
      Process.kill("QUIT", File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end
end

after_fork do |server, worker|
  Rails.cache.reset if Rails.cache.respond_to? :reset
  defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
end