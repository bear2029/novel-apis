class Crawler < ActiveRecord::Base
  validates :name, presence: true
  has_many :books
end
