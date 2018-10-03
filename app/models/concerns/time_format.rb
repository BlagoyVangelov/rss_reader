#Format time period
module TimeFormat
	def delta_time_in_seconds(pub_time_obj)
		(Time.now.to_i - pub_time_obj.to_i)
	end

	def formated_delta_time(pub_date)
		pub_date = pub_date.to_i

		case
		when delta_time_in_minutes(pub_date) < 1
			pub_date.to_s + " s"
		when delta_time_in_hours(pub_date) < 1
			delta_time_in_minutes(pub_date).to_s + " m"
		when delta_time_in_days(pub_date) < 1
			delta_time_in_hours(pub_date).to_s + " h"
		when delta_time_in_weeks(pub_date) < 1
			delta_time_in_days(pub_date).to_s + " d"
		when delta_time_in_months(pub_date) < 1
			delta_time_in_weeks(pub_date).to_s + " w"
		when delta_time_in_years(pub_date) < 1
			delta_time_in_months(pub_date).to_s + " mon"
		else
			delta_time_in_years(pub_date).to_s + " y"
		end

	end

	private

	def delta_time_in_minutes(pub_date)
		(pub_date/60).floor
	end

	def delta_time_in_hours(pub_date)
		(pub_date/(60*60)).floor
	end

	def delta_time_in_days(pub_date)
		(pub_date/(60*60*24)).floor
	end

	def delta_time_in_weeks(pub_date)
		(pub_date/(60*60*24*7)).floor
	end

	def delta_time_in_months(pub_date)
		(pub_date/(60*60*24*7*4)).floor
	end

	def delta_time_in_years(pub_date)
		(pub_date/(60*60*24*7*4*12)).floor
	end

end