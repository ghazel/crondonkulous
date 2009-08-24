Gem::Specification.new do |s|
  s.name = %q{crondonkulous}
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["David Bock"]
  s.date = %q{2009-08-24}
  s.description = %q{Ever need to have process run regularly for your rails app?  Ever want to use cron as the answer?  Sure you have!  So lets get it done.  It sounds pretty easy... use cron to automate the periodic execution of some rake tasks... but in practice we run into a couple of problems:  * Keeping the cron tasks in sync with your capistrano deploys * preventing the cron tasks from running while you are deploying/migrating * keeping the cron tasks from stepping on each other if they are taking longer than expected to run * having cron logging output intermingled with logging from your controllers  Ever have any of these problems?  I know I have.  So lets solve them once and for all, and bundle it into a gem with some reusable conventions.  Enter Crondonkulous!}
  s.email = ["dbock@codesherpas.com"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "rails_generators/templates/readme.txt"]
  s.files = ["History.txt", "Manifest.txt", "README.rdoc", "Rakefile", "lib/crondonkulous.rb", "lib/crondonkulous/recipes.rb", "rails_generators/crondonkulous_generator.rb", "rails_generators/templates/crondonkulous.rake", "rails_generators/templates/crontab.erb", "rails_generators/templates/readme.txt", "script/console", "script/destroy", "script/generate", "test/test_crondonkulous.rb", "test/test_helper.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/bokmann/crondonkulous}
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Ever need to have process run regularly for your rails app?  Ever want to use cron as the answer?  Sure you have!  So lets get it done}
  s.test_files = ["test/test_crondonkulous.rb", "test/test_helper.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<lockfile>, [">= 1.4.0"])
      s.add_development_dependency(%q<hoe>, [">= 2.3.3"])
    else
      s.add_dependency(%q<lockfile>, [">= 1.4.0"])
      s.add_dependency(%q<hoe>, [">= 2.3.3"])
    end
  else
    s.add_dependency(%q<lockfile>, [">= 1.4.0"])
    s.add_dependency(%q<hoe>, [">= 2.3.3"])
  end
end
