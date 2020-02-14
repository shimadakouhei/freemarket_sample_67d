json.array! @categories do |category|
  json.category_id category.id
  json.category_name category.name
end