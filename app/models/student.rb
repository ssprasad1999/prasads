class Student < ApplicationRecord
	validates :first_name, presence: true, length: {minimum:4, maximum:20}
	validates :last_name, presence: true, length: {minimum:4, maximum:20}
end