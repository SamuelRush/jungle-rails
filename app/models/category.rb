class Category < ActiveRecord::Base

  has_many :products

  def count_products
    @count_products = Product.where(category_id: id).count
  end

end
