namespace :deploy_app do
	desc 'Copy file to remote server'
	task :copy_to_remote do		
		system("scp #{fetch(:copy_from)} #{fetch(:test_server)}:/home/jenkins")
	end
end