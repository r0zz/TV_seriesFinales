# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require'csv'
csv_text=File.read('C:\Users\Rozzano\Desktop\users.txt')
my_csv=CSV.parse(csv_text,:headers=>true,:col_sep=>"\t")

my_csv.each do |row|
    User.create(username:row[0], password:row[1], email:row[2], preferences:row[3])
end


require'csv'
csv_text=File.read('C:\Users\Rozzano\Desktop\FinaleRatings.txt')
my_csv=CSV.parse(csv_text,:headers=>true,:col_sep=>"\t")

my_csv.each do |row|
    FinaleRating.create(series:row[0], viewership:row[1], householdrating:row[2], share:row[3], date:row[4], network:row[5])
end
