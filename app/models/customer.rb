class Customer < ActiveRecord::Base
  before_create :activate
  default_scope { where(active: true) }  

  def destroy
    self.active = false
    self.save
  end

  private
    def activate
      self.active = true
    end

end
