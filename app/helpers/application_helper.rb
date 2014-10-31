module ApplicationHelper
	def avatar_url(user, size)
		gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
	end

	def greeting
		time = Time.now.strftime("%H:%M")
		if time < "12:00"
			"Good Morning"
		elsif time < "18:00"
			"Good Afternoon"
		else
			"Good Evening"
		end
	end

	def start_time_title
		@perferance = current_user.perferances.where(:p_type => "Time").first
		if @perferance != nil
			case @perferance.duration
			when "30.minutes.ago"
				"Last 30 Minutes"
			when "1.hours.ago"
				"Last 1 hour"
			when "24.hours.ago"
				"Last 24 hours"
			when "3.days.ago"
				"Last 3 days"
			when "7.days.ago"
				"Last 7 days"
			when "all"
				"From the beginning"
			else
				"Last 30 Minutes"
			end
		end
		
	end

	def monitoring_data(document)
		@perferance = current_user.perferances.where(:p_type => "Time").first 
		if @perferance == nil
			document.monitoring_tables.where(:created_at => 30.minutes.ago..Time.now)
		else

			case @perferance.duration
			when "30.minutes.ago"
				document.monitoring_tables.where(:created_at => 30.minutes.ago..Time.now)
			when "1.hours.ago"
				document.monitoring_tables.where(:created_at => 1.hours.ago..Time.now)
			when "24.hours.ago"
				document.monitoring_tables.where(:created_at => 24.hours.ago..Time.now)
			when "3.days.ago"
				document.monitoring_tables.where(:created_at => 3.days.ago..Time.now)
			when "7.days.ago"
				document.monitoring_tables.where(:created_at => 7.days.ago..Time.now)
			when "all"
				document.monitoring_tables
			else
				document.monitoring_tables.where(:created_at => 30.minutes.ago..Time.now)
			end
		end
	end
end
