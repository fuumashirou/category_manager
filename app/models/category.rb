class Category < ActiveRecord::Base
	belongs_to :parent, class_name: "Category"
  has_many :children, class_name: "Category", foreign_key: "parent_id"

  def self.get_data(data_id)
    category_data = Category.find(data_id)

    family_data = []

    if(category_data.parent_id != nil)
    	category_data_parent = Category.find(category_data.parent_id)
      hash = {:parent_id => category_data_parent.id, :parent_name => category_data_parent.name}
    	family_data.push(hash)
    end

    if(category_data.children.count > 0)
    	category_data.children.each do |children|
    		hash = {:child_id => children.id, :child_name => children.name}
    		family_data.push(hash)
    	end
    end

    family_data

  end

  def self.set_new_category(category_name, category_parent_id = false)
  	category_data = Category.find_by(name: category_name)

  	if category_parent_id
  		parent_id = category_parent_id
  	else
  		parent_id = nil
  	end

  	if category_data.nil?
  		Category.create(name: category_name, parent_id: parent_id)
  	else
  		category_data.update(name: category_name, parent_id: parent_id)
  	end
  end

end
