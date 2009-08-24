require 'rubygems'
gem 'hoe', '>= 2.1.0'
require 'hoe'
require 'fileutils'
require './lib/crondonkulous'

Hoe.plugin :newgem

# Generate all the Rake tasks
# Run 'rake -T' to see list of generated tasks (from gem root directory)
$hoe = Hoe.spec 'crondonkulous' do
  self.developer 'David Bock', 'dbock@codesherpas.com'
  self.rubyforge_name       = self.name # TODO this is default value
  self.extra_deps         = [['lockfile','>= 1.4.0']]

end

require 'newgem/tasks'
Dir['tasks/**/*.rake'].each { |t| load t }

