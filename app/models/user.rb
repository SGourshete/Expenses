require 'securerandom'
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         :token_authenticable
         :confirmable

  #before_save :ensure_authentication_token
  #attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  before_create :set_auth_token


  def skip_confirmation
    self.confirmed_at = Time.now
  end

  private
  def set_auth_token
    return if authentication_token.present?
    self.authentication_token = generate_auth_token
  end

  def generate_auth_token
    SecureRandom.uuid.gsub(/\-/,'')
  end

  def user_params
    params.require(:user).permit(:username, :name, :email, :password, :password_confirmation)
  end

end
