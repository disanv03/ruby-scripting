include Math

def distance(lonA, latA, lonB, latB)
    x = (lonB - lonA) * cos((latA + latB) / 2)
    y = latB - latA
    d = sqrt(x**2 + y**2) * 6371
    return d
end

lon_user = gets.chomp.gsub(',', '.').to_f
lat_user = gets.chomp.gsub(',', '.').to_f
n = gets.chomp.to_i

closest_defib_name = nil
min_dist = Float::INFINITY # to make sure the first distance would be smaller

n.times do
  defib_data = gets.chomp.split(';')
  lon_defib = defib_data[4].gsub(',', '.').to_f
  lat_defib = defib_data[5].gsub(',', '.').to_f
  dist = distance(lon_user, lat_user, lon_defib, lat_defib)

  if dist < min_dist
    min_dist = dist
    closest_defib_name = defib_data[1]
  end
end



puts closest_defib
