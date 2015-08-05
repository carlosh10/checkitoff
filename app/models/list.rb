class List < ActiveRecord::Base
  has_many :items
  belongs_to :user
  
  def prune_list
    Item.where("created_at <= ?", Time.now - 7.days).destroy_all
  end
end