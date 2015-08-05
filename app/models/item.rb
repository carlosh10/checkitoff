class Item < ActiveRecord::Base
  belongs_to :list

  def days_left
    7 - ( (Time.now - created_at)/(60*60*24) ).to_i
  end

  def prune_list
    Item.where("created_at <= ?", Time.now - 7.days).destroy_all
  end
end
