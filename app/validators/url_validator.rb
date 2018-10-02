class UrlValidator < ActiveModel::EachValidator
	def validate_each(record, attribute, value)
		unless value =~ /\A(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,4})\/([\/\w\.-]*)*\/?\Z/i
			record.errors[attribute] << "is not valid"
		end
	end
end