class Project < ActiveRecord::Base
  belongs_to :user
  validates :Description, length: { maximum: 140 },
                            presence: true
end
