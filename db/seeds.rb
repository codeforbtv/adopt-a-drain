require 'csv'
require 'open-uri'


puts 'removing old things data'
Thing.destroy_all
csv_text = File.read("#{Rails.root}/public/BTVdrains.csv")
csv = CSV.parse(csv_text, :headers => true)
  csv.each do |row|
    city_id = row[0].to_i
    lat = row[1].to_f.round(10)
    long = row[2].to_f.round(10)

    if city_id > 1
      puts "#{city_id} #{lat} #{long} "
      Thing.create(:city_id =>  city_id, :lng => long, :lat=> lat)
    end
  end



