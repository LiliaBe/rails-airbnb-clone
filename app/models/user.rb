class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :instruments, dependent: :destroy

  validates :email, presence: true, uniqueness: true, format: { with: /\A(\w|.)+@[a-zA-Z]+.[a-zA-Z]{2,4}\z/,
                                                                message: "Wrong email format" }
                                                                validates :first_name, presence: true, uniqueness: true
                                                                validates :last_name, presence: true, uniqueness: true
  validates :bio, presence: true, uniqueness: true
  # validates :rating, presence: true, uniqueness: true, numericality: { only_integer: true }
  # validates :password, presence: true, uniqueness: true
end
