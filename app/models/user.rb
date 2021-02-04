class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true

  has_secure_password

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  has_many  :inverse_friendships,
            dependent: :destroy,
            class_name: 'Friendship',
            foreign_key: 'friend_id',
            inverse_of: :friend
  has_many :inverse_friends, through: :inverse_friendships, source: :user
  has_many :parties, dependent: :destroy, inverse_of: :host
  has_many :invitations, dependent: :destroy, inverse_of: :party_person

  before_save { email.try(:downcase!) }

  def name
    self[:name].presence || email
  end

  def add_friend(email)
    friend = User.find_by(email: email)
    friends << friend if friend && friends.exclude?(friend)
  end

  def all_friends
    friends + inverse_friends
  end
end
