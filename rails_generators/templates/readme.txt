Thanks for installing Crondonkulous!  There are still some things you have to do:

1) open up your config/deploy.rb used by capistrano, and add this line to the top:

  require 'crondonkulous/recipes.rb'

  Our recipes hook into your deploy to load the crontab.

2) Add this line to your config/environment.rb file:

   config.gem "lockfile"

3) uncomment the cron tasks you want to run in the config/crontab.erb file.

4) add your own code to the lib/tasks/crondonkulous.rake file.

5) optionally, you can add this line to your config/deploy.rb:
  
   set :cron_user, "username"

   If you don't set this, crondonkulous will default to the deploying user.

Have Fun!
  - Your friends at CodeSherpas