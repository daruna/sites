class Site < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true

  paginates_per 10
end
