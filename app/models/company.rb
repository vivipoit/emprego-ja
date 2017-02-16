class Company < ApplicationRecord

  has_many :jobs

  validates :name, presence: true

  def premium?

    self.jobs.count > 4

  end

end
