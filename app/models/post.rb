class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :user
	scope :by_last_created, -> { order(created_at: :desc) }
  validates :title, presence: true, length: {minimum: 5}
  validates :body, presence: true
end
