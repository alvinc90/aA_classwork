# json.extract! @guest, :name, :age, :favorite_color

# json.guest do
#     json.partial! 'api/guests/guest', banana: @guest
# end

json.partial! 'api/guests/guest', guest: @guest

json.gifts do
    @guest.gifts.each do |gift|
        json.extract! gift, :title, :description
    end
end