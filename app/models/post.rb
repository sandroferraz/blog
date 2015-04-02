class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :user
	scope :by_last_created, -> { order(created_at: :desc) }
  validates :title, presence: true, length: {minimum: 5}
  validates :body, presence: true

  has_attached_file :image, :styles => { :large => "600x600>", :medium => "300x300>", :thumb => "150x150#" }, :default_url => "http://lorempixel.com/400/200/city/3/"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
