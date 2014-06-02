class Product < ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true

  before_validation :assign_default_description

  private

    def assign_default_description
      if description.blank?
        self.description = name
      end
    end
end
