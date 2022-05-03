class Post < ApplicationRecord
  belongs_to :member

  validates :content, presence: true, length: { minimum: 5 }
  validates :member_id, presence: true, uniqueness: true
end
