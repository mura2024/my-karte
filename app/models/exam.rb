class Exam < ApplicationRecord
  belongs_to :user
  belongs_to :medical
  has_one_attached :image

  with_options if: :was_attached? do
    validates :title, presence: true
    validates :hospital, presence: true
    validates :exam_date, presence: true
    validates :comment, presence: true
  end

  def was_attached?
    self.image.attached?
  end
end
