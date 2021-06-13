class Score < ApplicationRecord
  belongs_to :courses
  belongs_to :users  
end