class CrondonkulousGenerator < Rails::Generator::Base
  def manifest
    record do |m|
      m.file('crondonkulous.rake', 'lib/tasks/crondonkulous.rake')
      m.file('crontab.erb', 'config/crontab.erb')
      m.readme('readme.txt')
    end
  end
end
