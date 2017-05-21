namespace :run_command do
  desc 'list file in remote server'
  task :list_file do
    puts 'listing file'
    on roles(:testserver) do
      execute "ls -la"
    end
  end
end

