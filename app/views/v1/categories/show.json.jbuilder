json.array!(@output) do |output|
  json.extract! output, :id, :name, :parent_id, parent_name, parent_child
  json.url product_url(output, format: :json)
end

