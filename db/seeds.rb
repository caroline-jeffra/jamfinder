# For now, this seeds do not create: chatrooms, user_chatrooms, messages, jams, user_jams, videos, audios, and images.

# Just in case a left pexels in here
# Sets Pexels client
# client = Pexels::Client.new

puts 'Cleaning database...'
# Destroy chat
Message.destroy_all
UserChatroom.destroy_all
Chatroom.destroy_all

# Destroy Jams
Jam.destroy_all
UserJam.destroy_all

# Destroy User's medias
Audio.destroy_all
Video.destroy_all
Image.destroy_all

# Destroy instruments, genres and users
Instrument.destroy_all
UserInstrument.destroy_all
Genre.destroy_all
UserGenre.destroy_all
User.destroy_all

INSTRUMENTS = [
  { name: 'accordion', category: 'keyboard' },
  { name: 'bagpipes', category: 'wind' },
  { name: 'bongo', category: 'percussion' },
  { name: 'cello', category: 'string' },
  { name: 'guitar', category: 'string' },
  { name: 'harmonica', category: 'wind' },
  { name: 'harp', category: 'string' },
  { name: 'keyboard', category: 'keyboard' },
  { name: 'mandolin', category: 'string' },
  { name: 'oboe', category: 'wind' },
  { name: 'ocarina', category: 'wind' },
  { name: 'piano', category: 'keyboard' },
  { name: 'saxophone', category: 'wind' },
  { name: 'tambourine', category: 'percussion' },
  { name: 'triangle', category: 'percussion' },
  { name: 'vocals', category: 'vocals' },
  { name: 'zither', category: 'string' },
  { name: 'xylophone', category: 'percussion' },
  { name: 'snare', category: 'percussion' },
  { name: 'flute', category: 'wind' }
]

puts "Creating instruments..."

INSTRUMENTS.each do |instrument|
  Instrument.create!(instrument)
end

puts "#{Instrument.count} instruments created"

GENRES = [
  { name: 'Dream pop' },
  { name: 'Sung poetry' },
  { name: 'Trad jazz' },
  { name: 'Indie folk' },
  { name: 'Boogie' },
  { name: 'Avant-garde jazz' },
  { name: 'Traditional folk' },
  { name: 'Progressive rock' },
  { name: 'Ska jazz' },
  { name: 'Downtempo' },
  { name: 'Jazz blues' },
  { name: 'Rock fusion' },
  { name: 'Twee Pop' }
]

puts "Creating genres..."

GENRES.each do |genre|
  Genre.create!(genre)
end

puts "#{Genre.count} genres created"

puts "Creating profiles..."

User.create!(
  first_name: 'Adrian',
  last_name: 'Placeholder',
  email: 'Adrian@email.com',
  password: 'password',
  display_name: 'Adrian',
  avatar_url: 'https://avatars.githubusercontent.com/u/139060899?v=4',
  banner_url: 'https://wallpapercave.com/wp/wp11903020.jpg',
  address: '1017HV',
  instruments: [ Instrument.find_by(name: "vocals"), Instrument.find_by(name: "guitar") ],
  tagline: "",
  bio: ""
)
User.create!(
  first_name: 'Aleem',
  last_name: 'Placeholder',
  email: 'Aleem@email.com',
  password: 'password',
  display_name: 'Aleem',
  avatar_url: 'https://avatars.githubusercontent.com/u/28513224?v=4',
  banner_url: 'https://wallpapercave.com/wp/wp10347654.jpg',
  address: '1057NT',
  instruments: [ Instrument.find_by(name: "saxophone"), Instrument.find_by(name: "vocals") ],
  tagline: "",
  bio: ""
)
User.create!(
  first_name: 'Callum',
  last_name: 'Placeholder',
  email: 'Callum@email.com',
  password: 'password',
  display_name: 'Callum',
  avatar_url: 'https://avatars.githubusercontent.com/u/116356064?v=4',
  banner_url: 'https://wallpapercave.com/wp/wp3454635.jpg',
  address: '1015KJ',
  instruments: [ Instrument.find_by(name: "harmonica"), Instrument.find_by(name: "tambourine") ],
  tagline: "",
  bio: ""
)
User.create!(
  first_name: 'Caroline',
  last_name: 'Placeholder',
  email: 'Caroline@email.com',
  password: 'password',
  display_name: 'Caroline',
  avatar_url: 'https://avatars.githubusercontent.com/u/138127305?v=4',
  banner_url: 'https://wallpapercave.com/wp/wp4134869.jpg',
  address: '1014EE',
  instruments: [ Instrument.find_by(name: "mandolin") ],
  tagline: "",
  bio: ""
)
User.create!(
  first_name: 'Cristian',
  last_name: 'Placeholder',
  email: 'Cristian@email.com',
  password: 'password',
  display_name: 'Cristian',
  avatar_url: 'https://avatars.githubusercontent.com/u/138874915?v=4',
  banner_url: 'https://wallpapercave.com/wp/wp4135070.jpg',
  address: '1015FF',
  instruments: [ Instrument.find_by(name: "oboe"), Instrument.find_by(name: "harp") ],
  tagline: "",
  bio: ""
)
User.create!(
  first_name: 'Daniele',
  last_name: 'Placeholder',
  email: 'Daniele@email.com',
  password: 'password',
  display_name: 'Daniele',
  avatar_url: 'https://avatars.githubusercontent.com/u/79024584?v=4',
  banner_url: 'https://wallpapercave.com/wp/wp4136074.jpg',
  address: '1016GP',
  instruments: [ Instrument.find_by(name: "zither"), Instrument.find_by(name: "piano") ],
  tagline: "",
  bio: ""
)
User.create!(
  first_name: 'Francesco',
  last_name: 'Placeholder',
  email: 'Francesco@email.com',
  password: 'password',
  display_name: 'Francesco',
  avatar_url: 'https://avatars.githubusercontent.com/u/5818940?v=4',
  banner_url: 'https://wallpapercave.com/wp/HTiPvGX.jpg',
  address: '1062JB',
  instruments: [ Instrument.find_by(name: "guitar"), Instrument.find_by(name: "harmonica") ],
  tagline: "",
  bio: ""
)
User.create!(
  first_name: 'Marius',
  last_name: 'Placeholder',
  email: 'Marius@email.com',
  password: 'password',
  display_name: 'Marius',
  avatar_url: 'https://avatars.githubusercontent.com/u/138881754?v=4',
  banner_url: 'https://wallpapercave.com/wp/wp4132920.jpg',
  address: '1018EF',
  instruments: [ Instrument.find_by(name: "triangle"), Instrument.find_by(name: "accordion") ],
  tagline: "",
  bio: ""
)
User.create!(
  first_name: 'Matheus',
  last_name: 'Placeholder',
  email: 'Matheus@email.com',
  password: 'password',
  display_name: 'Matheus',
  avatar_url: 'https://avatars.githubusercontent.com/u/78371638?v=4',
  banner_url: 'https://wallpapercave.com/wp/wp4133097.jpg',
  address: '1019CC',
  instruments: [ Instrument.find_by(name: "keyboard"), Instrument.find_by(name: "bongo") ],
  tagline: "",
  bio: ""
)
User.create!(
  first_name: 'Nancy',
  last_name: 'Placeholder',
  email: 'Nancy@email.com',
  password: 'password',
  display_name: 'Nancy',
  avatar_url: 'https://avatars.githubusercontent.com/u/64468956?v=4',
  banner_url: 'https://wallpapercave.com/wp/wp4134229.jpg',
  address: '1011EN',
  instruments: [ Instrument.find_by(name: "xylophone"), Instrument.find_by(name: "piano") ],
  tagline: "",
  bio: ""
)
User.create!(
  first_name: 'Nathan',
  last_name: 'Placeholder',
  email: 'Nathan@email.com',
  password: 'password',
  display_name: 'Nathan',
  avatar_url: 'https://ca.slack-edge.com/T02NE0241-U05FRFGF7K9-d997ff9f3224-512',
  banner_url: 'https://wallpapercave.com/wp/wp4132927.jpg',
  address: '1056GL',
  instruments: [ Instrument.find_by(name: "bagpipes"), Instrument.find_by(name: "snare") ],
  tagline: "",
  bio: ""
)
User.create!(
  first_name: 'Prachi',
  last_name: 'Placeholder',
  email: 'Prachi@email.com',
  password: 'password',
  display_name: 'Prachi',
  avatar_url: 'https://avatars.githubusercontent.com/u/126870650?v=4',
  banner_url: 'https://wallpapercave.com/wp/wp2832280.jpg',
  address: '1014CD',
  instruments: [ Instrument.find_by(name: "cello"), Instrument.find_by(name: "flute") ],
  tagline: "",
  bio: ""
)
User.create!(
  first_name: 'Sophia',
  last_name: 'Placeholder',
  email: 'Sophia@email.com',
  password: 'password',
  display_name: 'Sophia',
  avatar_url: 'https://avatars.githubusercontent.com/u/138873317?v=4',
  banner_url: 'https://wallpapercave.com/wp/wp4135219.jpg',
  address: '1059CD',
  instruments: [ Instrument.find_by(name: "ocarina"), Instrument.find_by(name: "vocals") ],
  tagline: "",
  bio: ""
)

puts "#{User.count} profiles created"
