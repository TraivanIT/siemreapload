module ApplicationHelper

	def time_ago time
		"#{time_ago_in_words(time)} ago"
	end

	def status_convert(status, truthy: nil, falsey: nil)
		if status
			truthy
		else
			falsey
		end
				
	end

	def admin_active? path
    "admin-active" if current_page? path
  end
end
