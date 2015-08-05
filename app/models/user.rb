class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :confirmable, :trackable, :validatable
  
  has_one :list

  after_create :add_list

  private

  def add_list
    list = List.new(title: "#{name}'s List", user_id: id).save!
  end

end
