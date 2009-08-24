Capistrano::Configuration.instance.load do

  #TODO wouldn't it be awesome if the deploy would wait for the crondonkulous rakefile to unlock?
  set :cron_user, nil
  
  before "deploy:update_code", "crondonkulous:clear_crontab"
  after "deploy:finalize_update", "crondonkulous:load_crontab"
  
  namespace :crondonkulous do

    task :load_crontab do
      require 'erb'
      tempfile = "#{current_path}/log/crontab.rendered"
      crontab = ERB.new(File.read("config/crontab.erb")).result(binding)
      put crontab, "#{tempfile}"
      u = cron_user || user
      sudo "crontab -u #{u} #{tempfile}"
    end
    
    task :clear_crontab do
      begin
        u = cron_user || user
        sudo "crontab -r -u #{u}"
      rescue
      end
      sleep 30 #TODO I want to make this safer, but lets give stuff a chance to finish...
    end
    
  end

end
