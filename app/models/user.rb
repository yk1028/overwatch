class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  #해당하는 User를 찾아주는 함수
  def self.matching (gender, age, position, tier)
    where(gender: gender).where(age: age).where(position: position).where(tier: tier)
  end  
end
