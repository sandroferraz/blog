class Post < ActiveRecord::Base
	scope :by_last_created, -> { order(created_at: :desc) }
  validates :title, presence: true, length: {minimum: 5}
  validates :body, presence: true
end
