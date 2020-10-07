# json.extract! @gifts, :title, :description

json.array! @gifts do |gift|
    json.title gift.title
    json.description gift.description
end