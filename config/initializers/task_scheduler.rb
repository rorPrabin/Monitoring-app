require 'rubygems'
require 'rufus/scheduler'

scheduler = Rufus::Scheduler.start_new

# Project.all.each do |p|
# 	interval = p.interval * 60
# 	scheduler.every interval do
#   		p.monitor_project
# 	end
# end


scheduler.every '2h' do
	Project.monitor_projects
end




