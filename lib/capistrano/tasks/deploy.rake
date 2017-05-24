namespace :deploy_app do
	desc 'Copy back end app to remote server'
	task :copy_to_remote do		
		system("scp #{fetch(:copy_from)} #{fetch(:test_server)}:/home/jenkins")
	end
	
	desc 'Start backend students'
	task :start_students do
		puts 'Starting students.....'
		on roles(:testserver) do
	      execute "nohup java -jar students-1.jar > /dev/null 2>&1 &"
	    end		
	end
	
	desc 'Stop backend students'
	task :stop_students do
		puts 'Stopping students....'
		on roles(:testserver) do
	      execute "ps -ef | grep students-1.jar | grep -v grep | awk '{print $2}' | xargs kill"
	    end	
	end
	
	desc 'Copy front end app to remote server'
	task :copy_ui_to_remote do		
		system("scp #{fetch(:copy_ui_from)} #{fetch(:test_server)}:/home/jenkins")
	end
	
	desc 'Start UI students'
	task :start_ui_students do
		puts 'Starting students.....'
		on roles(:testserver) do
	      execute "nohup java -jar demo-0.0.1-SNAPSHOT.jar > /dev/null 2>&1 &"
	    end		
	end
	
	desc 'Stop UI students'
	task :stop_ui_students do
		puts 'Stopping students....'
		on roles(:testserver) do
	      execute "ps -ef | grep demo-0.0.1-SNAPSHOT.jar | grep -v grep | awk '{print $2}' | xargs kill"
	    end	
	end
end