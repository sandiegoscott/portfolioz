class User < ActiveRecord::Base
  enum role: [:user, :vip, :admin]

  after_initialize :set_default_role, :if => :new_record?

  validates   :name, presence: true
  validates   :email, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  private

  def set_default_role
    self.role ||= :user
  end

end
