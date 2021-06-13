class User < ApplicationRecord
  has_secure_password

  has_many :scores, dependent: :destroy

  accepts_nested_attributes_for :scores


end
