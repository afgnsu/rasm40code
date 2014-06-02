class Product < ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true
  has_many :line_items
  has_many :purchases, -> { uniq }, through: :line_items

  before_validation :assign_default_description

  private

    def assign_default_description
      if description.blank?
        self.description = name
      end
    end
end
