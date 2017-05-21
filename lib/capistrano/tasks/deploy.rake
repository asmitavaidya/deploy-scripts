namespace :deploy_app do
	desc 'Copy file to remote server'
	task :copy_to_remote do		
		system("scp #{fetch(:copy_from)} #{fetch(:test_server)}:/home/jenkins")
	end
	
	desc 'Start students'
	task :start_students do
		puts 'Starting students.....'
		on roles(:testserver) do
	      execute "java -jar students-1.jar"
	    end		
	end
	
	desc 'Stop students'
	task :stop_students do
		puts 'Stopping students....'
		on roles(:testserver) do
	      execute "ps -ef | grep students-1.jar | grep -v grep | awk '{print $2}' | xargs kill"
	    end	
	end
end