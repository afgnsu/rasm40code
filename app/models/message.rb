class Message < ActiveRecord::Base
  validates :author, presence: true
  validates :message, presence: true
end
