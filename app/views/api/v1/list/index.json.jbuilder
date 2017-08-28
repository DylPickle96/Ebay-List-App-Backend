json.array! @list do |list_item|
  json.title list_item[:title]
  json.category list_item[:category]
  json.picture list_item[:picture]
  json.location list_item[:location]
  json.price list_item[:price]
  json.startdate list_item[:startdate]
  json.url list_item[:url]
end
