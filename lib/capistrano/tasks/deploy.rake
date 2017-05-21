namespace :deploy_app do
	desc 'Copy file to remote server'
	task :copy_to_remote do		
		system("scp #{copy_from} #{testserver}:/home/jenkins")
	end
end