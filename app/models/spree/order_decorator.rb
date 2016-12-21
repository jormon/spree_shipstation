Spree::Order.class_eval do
  def custom_tags
    tags = []

    if respond_to?(:subscription?) && subscription?
      tags << :subscription
    end

    if respond_to?(:new_order_for_email?) && new_order_for_email?
      tags << :first_order
    end

    if respond_to?(:wholesale?) && wholesale?
      tags << :wholesale
    end

    tags
  end
end
