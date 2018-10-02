class Feed < ApplicationRecord
	validates :url, presence: true, allow_blank: false, url: true, uniqueness: true
end
