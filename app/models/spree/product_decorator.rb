Spree::Product.class_eval do
  #attr_accessible :subscribable, :subscription_interval_ids, :subscribed_price

  delegate_belongs_to :master, :subscribed_price

  has_and_belongs_to_many :subscription_intervals, :foreign_key => "product_id", :join_table => 'spree_subscription_intervals_products'
  alias :intervals :subscription_intervals

  scope :subscribable, where(:subscribable => true)
  scope :unsubscribable, where(:subscribable => false)
end
