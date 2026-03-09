puts "Cleaning database..."

Bookmark.destroy_all
Movie.destroy_all
List.destroy_all

puts "Creating movies..."

Movie.create!(
  title: "Wonder Woman 1984",
  overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s",
  poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg",
  rating: 6.9
)

Movie.create!(
  title: "The Shawshank Redemption",
  overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison",
  poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg",
  rating: 8.7
)

Movie.create!(
  title: "Titanic",
  overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.",
  poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg",
  rating: 7.9
)

Movie.create!(
  title: "Ocean's Eight",
  overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.",
  poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg",
  rating: 7.0
)

puts "Created #{Movie.count} movies"

puts "Creating lists..."

lists = [
  { name: "Drama" },
  { name: "Comédia" },
  { name: "Suspense" },
  { name: "Ação" },
  { name: "Romance" },
  { name: "Favoritos" },
  { name: "Para ver" },
  { name: "Horror" }
]

lists.each do |list_attrs|
  List.create!(list_attrs)
end

puts "Created #{List.count} lists"

puts "Creating bookmarks..."

# Buscar filmes
wonder_woman = Movie.find_by(title: "Wonder Woman 1984")
shawshank = Movie.find_by(title: "The Shawshank Redemption")
titanic = Movie.find_by(title: "Titanic")
oceans = Movie.find_by(title: "Ocean's Eight")

# Buscar listas
drama = List.find_by(name: "Drama")
acao = List.find_by(name: "Ação")
favoritos = List.find_by(name: "Favoritos")
romance = List.find_by(name: "Romance")
para_ver = List.find_by(name: "Para ver")

Bookmark.create!(
  movie: wonder_woman,
  list: acao,
  comment: "Adorei este filme! Muita ação e a Mulher Maravilha está incrível!"
)

Bookmark.create!(
  movie: wonder_woman,
  list: favoritos,
  comment: "Um dos melhores filmes de super-heróis!"
)

Bookmark.create!(
  movie: shawshank,
  list: drama,
  comment: "Filme emocionante, chorei no final!"
)

Bookmark.create!(
  movie: shawshank,
  list: favoritos,
  comment: "Simplesmente o melhor filme de todos os tempos!"
)

Bookmark.create!(
  movie: titanic,
  list: romance,
  comment: "História de amor inesquecível!"
)

Bookmark.create!(
  movie: titanic,
  list: drama,
  comment: "Triste mas muito bonito"
)

Bookmark.create!(
  movie: oceans,
  list: acao,
  comment: "Muito divertido, elenco feminino incrível!"
)

Bookmark.create!(
  movie: oceans,
  list: para_ver,
  comment: "Disseram que é muito bom, quero assistir!"
)

puts "Created #{Bookmark.count} bookmarks"

puts "Seed completed successfully!"
