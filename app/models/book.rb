class Book < ActiveRecord::Base
  belongs_to :author
  has_many :chapter
  has_one :crawler
end
