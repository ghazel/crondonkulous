namespace :crondonkulous do

  desc "Your description here"
  task :every_minute => :environment do
    crondonkulous_wrapper(RAILS_ROOT + "/log/every_minute.log", 0) do
      #your code here
    end
  end
  
  desc "Your description here"
  task :every_5_minutes => :environment do
    crondonkulous_wrapper(RAILS_ROOT + "/log/every_5_minutes.log", 0) do
      #your code here
    end
  end
  
  desc "Your description here"
  task :every_15_minutes => :environment do
    crondonkulous_wrapper(RAILS_ROOT + "/log/every_15_minutes.log", 0) do
      #your code here
    end
  end
  
  desc "Your description here"
  task :every_hour => :environment do
    crondonkulous_wrapper(RAILS_ROOT + "/log/every_hour.log", 0) do
      #your code here
    end
  end
  
  desc "Your description here"
  task :every_week => :environment do
    crondonkulous_wrapper(RAILS_ROOT + "/log/every_week.log", 0) do
      #your code here
    end
  end
  
  desc "Your description here"
  task :every_month => :environment do
    crondonkulous_wrapper(RAILS_ROOT + "/log/every_month.log", 0) do
      #your code here
    end
  end

end

def crondonkulous_wrapper(logfile, retries = 0)
  ActiveRecord::Base.logger = Logger.new(logfile)
  ActiveRecord::Base.logger.info "*-"*38
  ActiveRecord::Base.logger.info "** Invoked at #{Time.now}"
  
  begin
    Lockfile.new(RAILS_ROOT + "/log/crondonkulous.lock", :retries => retries) do      
      yield
    end
  rescue Lockfile::MaxTriesLockError => e      
    ActiveRecord::Base.logger.info "Another process is running.  Exiting gracefully."
  rescue
    ActiveRecord::Base.logger.error $!
  ensure
    ActiveRecord::Base.logger.info "** Completed at #{Time.now}"
    ActiveRecord::Base.logger.close
  end
end

