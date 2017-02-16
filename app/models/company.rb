class Company < ApplicationRecord

  has_many :jobs

  def premium?

    self.jobs.count > 4

  end

end
