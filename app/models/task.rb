class Task < ApplicationRecord
  belongs_to :user
  
  validates :task_name, presence: true, length: { maximum: 50 }
  validates :task_description, presence: true, length: { maximum: 100 }
end
