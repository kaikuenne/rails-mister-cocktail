url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
data = JSON.parse(open(url).read)

drinks = data["drinks"]

drinks.each do |ingredient|

  ingredient.each do |k, v|
    ingredient = Ingredient.create(name: v)
    Cocktail.create(name: Faker::RuPaul.queen, remote_photo_url: 'https://ssli.ebayimg.com/images/g/hM0AAOSwX61ZAyYh/s-l640.jpg')
  end
end

66.times do
  dose = Dose.new(description: "#{rand(1..6)} cl", cocktail_id: Cocktail.all.sample.id, ingredient_id: Ingredient.all.sample.id)
  p dose.valid?
  dose.save
end
