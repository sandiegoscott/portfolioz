class User < ActiveRecord::Base
  enum role: [:user, :vip, :admin]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to  :household

  #validates   :household, presence: true
  validates   :name, presence: true
  validates   :email, presence: true

  after_initialize :set_default_role, :if => :new_record?

  private

  def set_default_role
    self.role ||= :user
  end

end
