class Room < ApplicationRecord
	has_many :message_groups
end
