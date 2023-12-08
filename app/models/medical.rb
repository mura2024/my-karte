class Medical < ApplicationRecord
  belongs_to :user
  has_many :exams

  validates :subject, presence: true
end
