class User < ActiveRecord::Base
  has_many :projects
  validates FILL_IN, presence: true
  validates FILL_IN, presence: true
end
