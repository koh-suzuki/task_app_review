class Task < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  
  validates :task_name, presence: true, length: { maximum: 50 }
  validates :task_description, presence: true, length: { maximum: 100 }
end
