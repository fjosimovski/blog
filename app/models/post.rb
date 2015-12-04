class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  validates :username, presence: true
end
