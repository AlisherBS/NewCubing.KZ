class AddDiscussionSubscriptionToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :discussion_subscription, :boolean
    add_column :users, :newsletter_subscription, :boolean
  end
end
