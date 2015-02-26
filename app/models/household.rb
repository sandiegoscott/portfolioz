class Household < ActiveRecord::Base

  has_many    :members, :class_name => User, :dependent => :destroy
  has_many    :sources, :dependent => :destroy
  has_many    :brokerages, :dependent => :destroy
  has_many    :accounts, :through => :brokerages

  validates   :name, presence: true

  # ================ methods ================

  def explain( tag )
    puts ">>>> /#{tag}/  #{self.class.to_s}  valid?=#{self.valid?}  #{self.inspect}"
  end

end
