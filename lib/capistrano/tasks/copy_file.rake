namespace :copy_file do
  desc 'copying file to remote server'
  task :copy_file do
    puts 'copying file'
    system("scp /Users/asmita/copyme.txt asmita@54.245.63.109:/home/asmita/")
  end
end
