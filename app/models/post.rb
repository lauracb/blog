class Post < ApplicationRecord
  has_many :comments, dependent: :delete_all
  belongs_to :user
  validates :title, :body, presence: true
  validates :body, length: { minimum: 250 }
  
end
