json.array!(@categories) do |category|
  json.id			category.id	
  json.title		category.title
  json.description	category.description
end