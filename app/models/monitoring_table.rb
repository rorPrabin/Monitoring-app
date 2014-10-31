class MonitoringTable < ActiveRecord::Base
	belongs_to :Project, :dependent => :destroy
end
