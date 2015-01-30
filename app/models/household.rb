class Household < ActiveRecord::Base

  has_many  :members, :class_name => User, :dependent => :destroy
  has_many  :brokerages, :dependent => :destroy
  has_many  :accounts, :through => :brokerages
  has_many  :investments
  has_many  :sources, :dependent => :destroy

  validates_presence_of  :name

  #attr_accessible :name

  # ================ methods ================

  def explain( tag )
    puts ">>>> /#{tag}/  #{self.class.to_s}  valid?=#{self.valid?}  #{self.inspect}"
  end

end
