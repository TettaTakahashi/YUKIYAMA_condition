# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

 Admin.find_or_create_by!(
   email: 'aaa@aaa',
   password: "#{ENV['SECRET_KEY']}"
 )

Prefecture.find_or_create_by!(
  prefecture_name: "北海道"
)


Owner.find_or_create_by!(email: 'ggg@email') do |owner|
  owner.owner_name = "経営一郎"
  owner.email = 'ggg@email'
  owner.password = "aaaaaa"
end


SkiResort.find_or_create_by!(name: "◯◯スノーリゾート") do |ski_resort|
  ski_resort.image.attach(io: File.open(Rails.root.join("db/fixtures/sample-1.jpg")), filename: 'sample-1.jpg')
  ski_resort.introduction = "自然の地形を活かしたコースは、ビギナーからエキスパートまで楽しめる全26コース。最長滑走距離はなんと6,000mもあるビッグスケール！"
  ski_resort.sales_active = true
  ski_resort.snow_active = true
  ski_resort.waiting_time = "10分〜15分"
  ski_resort.price = "4500"
  ski_resort.road_condition = "圧雪"
  ski_resort.weather = "曇り"
  ski_resort.prefecture_id = 1
  ski_resort.owner_id = 1
end

SkiResort.find_or_create_by!(name: "◯◯スキーパーク") do |ski_resort|
  ski_resort.image.attach(io: File.open(Rails.root.join("db/fixtures/sample-2.jpg")), filename: 'sample-2.jpg')
  ski_resort.introduction = "3つのマウンテンパークに、ビギナーからエキスパートまで楽しめる多彩な14コースがラインナップ。また、降雪時にはパウダースノーが満喫できるツリーランエリアが解放！"
  ski_resort.sales_active = true
  ski_resort.snow_active = false
  ski_resort.waiting_time = "5分〜10分"
  ski_resort.price = "5000"
  ski_resort.road_condition = "圧雪"
  ski_resort.weather = "雪"
  ski_resort.prefecture_id = 1
  ski_resort.owner_id = 1
end

SkiResort.find_or_create_by!(name: "◯◯スキー場") do |ski_resort|
  ski_resort.image.attach(io: File.open(Rails.root.join("db/fixtures/sample-3.jpg")), filename: 'sample-3.jpg')
  ski_resort.introduction = "内陸に位置するスキー場ならではの良質な雪が魅力のスキー場です。最長滑走距離4,000mビッグゲレンデは初級者から上級者まで楽しめるバリエーション豊かな全28コース"
  ski_resort.sales_active = true
  ski_resort.snow_active = true
  ski_resort.waiting_time = "15分〜20分"
  ski_resort.price = "4000"
  ski_resort.road_condition = "圧雪"
  ski_resort.weather = "雪"
  ski_resort.prefecture_id = 1
  ski_resort.owner_id = 1
end