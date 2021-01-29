class Task < ApplicationRecord

  validates :title, presence: true, uniqueness: { scope: :projects }

end
