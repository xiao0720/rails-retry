class Comment < ActiveRecord::Base
  acts_as_tree order: 'created_at DESC'

  belongs_to :user
  belongs_to :post

  validates :content, presence: true
end
