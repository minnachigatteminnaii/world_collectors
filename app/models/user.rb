class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items, through: :cart_items
  has_many :cart_items
  has_many :shopping_addresses
  has_many :orders
  has_many :contacts
  has_many :items, through: :favorites
  has_many :favorites

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :kana_first, presence: true
  validates :kana_last, presence: true
  validates :postal_code, presence: true
  validates :email, presence: true
  validates :encrypted_password, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :is_delete, presence: true

  enum is_delete: {  exist: 0, remove: 1 }
end
