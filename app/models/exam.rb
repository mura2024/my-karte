class Exam < ApplicationRecord
  belongs_to :user
  belongs_to :medical
  has_one_attached :image

  with_options presence: true do
    validates :title
    validates :hospital
    validates :exam_date
    validates :comment
  end
end
