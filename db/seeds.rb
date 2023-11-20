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
  { name: 'vocals', category: 'vocal' },
  { name: 'zither', category: 'string' },
  { name: 'xylophone', category: 'percussion' },
  { name: 'snare', category: 'percussion' },
  { name: 'trombone', category: 'wind' },
  { name: 'flute', category: 'wind' }
]

puts "Creating instruments..."

INSTRUMENTS.each do |instrument|
  Instrument.create!(instrument)
end

puts "#{Instrument.count} instruments created"

GENRES = [
  { name: 'avant-garde-jazz' },
  { name: 'boogie' },
  { name: 'downtempo' },
  { name: 'dream-pop' },
  { name: 'classical-grime' },
  { name: 'jazz-blues' },
  { name: 'progressive-rock' },
  { name: 'rock-fusion' },
  { name: 'ska-jazz' },
  { name: 'sung-poetry' },
  { name: 'trad-jazz' },
  { name: 'traditional-folk' },
  { name: 'twee-pop' }
]

puts "Creating genres..."

GENRES.each do |genre|
  Genre.create!(genre)
end

puts "#{Genre.count} genres created"

TAGLINE = [
  "Serenading Souls Through Melodies",
  "Crafting Emotions with Soundwaves",
  "Strings and Beats, My Musical Canvas",
  "Notes Dance, I'm the Choreographer",
  "Musical Stories Painted in Tunes",
  "Journeying Through Soundscapes",
  "Feelings Echo in Every Chord",
  "Lyrics of Life, Sung by Me",
  "Rhythmic Pulse of My Heart",
  "Expressing Life's Rhythm in Songs",
  "Creating Harmony, Sharing Love",
  "Soundscape Architect, Music's Muse",
  "Unlocking Emotions with Harmony",
  "Dreams Whispered Through Melodies",
  "Chords Connect, Music Reflects",
  "Composing Life's Symphony",
  "Tunes Unite, Hearts Take Flight",
  "Soulful Melodies, My Language",
  "Notes Weave Tales of Life",
  "Harmonious Vibes, My Passion's Drive",
  "Playing Feelings, Crafting Sound",
  "Musical Narratives from the Heart",
  "Melding Beats, Shaping Souls",
  "Strings of My Heart, Notes of My Soul",
  "Life's Palette, Tinged with Music",
  "Capturing Moments in Musical Frames",
  "Strumming Dreams into Reality",
  "Chords of Life, Music of Me",
  "Soundtrack of Emotions, That's Me",
  "Heartfelt Lyrics, My True Expression",
  "Melodies Painted on Silence",
  "Orchestrating Memories with Music",
  "Playing Life's Tune, Note by Note",
  "Strings Attached to My Dreams",
  "Singing Life's Verses in Harmony",
  "Musical Euphoria, My Way",
  "Harmonizing the Universe Within",
  "Emotions Resonate in Every Note",
  "Melodies Speak Louder Than Words",
  "Songs as Mirrors of My Soul",
  "Composing Life's Masterpiece",
  "Music's Embrace, My Refuge",
  "Rhythmic Whispers, My Calling",
  "Sculpting Sound, Crafting Dreams",
  "Strings of Hope, Melodies of Joy",
  "Melodies Connect, Beyond Language",
  "Tales Woven in Harmonic Threads",
  "Striking Chords, Shaping Destinies",
  "Singing My Truth, Every Verse",
  "Harmonies Heal, Notes Mend",
  "Composing Life's Symphony",
  "Music's Tapestry, Woven by Me",
  "In Notes We Trust, My Melody",
  "Rhythms Painted on the Air",
  "Strumming the Language of Emotions",
  "Sonic Brushstrokes of My Mind",
  "Echoes of Dreams in Every Note",
  "Music's Journey, Guided by Heart"
].freeze

puts "Creating profiles..."

BIO = [
  "🎵 Groove creator mixing hip-hop vibes with electronic beats. Spreading musical love worldwide. Catch me on stage for some #MusicMagic!",
  "🎶 Soulful singer-songwriter crafting melodies that touch hearts. Let's connect through music and share some #SoulfulSounds.",
  "🎹 Keyboard maestro jazzing up melodies and creating magic note by note. Join me on my journey as a #PianoWizard!",
  "🎧 Electronic explorer and sound sculptor. Dive into my sonic universe, and let's vibe together through #Soundscapes.",
  "🎻 Bridging classical and modern, I'm a violin dreamer. Let's journey through harmonies and speak the universal language of music. #StringsConnect",
  "🎙️ Lyric weaver and rhythmic storyteller. Capturing emotions in every verse, I invite you to join me on my musical journey of #VerseVibes.",
  "🎤 Vocal acrobat and R&B sensation. My notes touch the soul, and I welcome you to join me on this melodious ride of #SoulfulMelodies.",
  "🕺 Dancefloor commander by night and dreamer by day. Creating beats that make you move. Let's groove together and catch the #DanceFever!",
  "Guitar guru strumming through emotions and making melodies that resonate. Let's rock on and experience some #GuitarMagic.🎸",
  "🎵 Melody sculptor crafting feelings into tunes. Join me in this musical odyssey as we create symphonies together. 🎹🌌 #SymphonicSoul🎧" ,
  "Sound architect mixing and molding sonic realms. Let's explore soundscapes together and hear the world differently. #SoundExplorer",
  "🥁 Drumbeat chaser and rhythm weaver. On a percussive soul journey. Let's find the groove together and embark on a musical #BeatQuest.",
  "🎶 Music magician. Notes that spark imagination. Join me in this sonic adventure and let the melodies enchant you. 🎩✨ #EnchantedTunes",
  "🎤 Vocal wanderer harmonizing emotions with lyrics that paint stories. Let's sing life's melody together in #HarmonicTales.",
  "🎵 Songwriter's haven. Crafting dreams into lyrics. Join my melodic world and let's make music that truly matters. 📝🎶 #DreamWeaver"
].freeze

User.create!(
  first_name: 'Adrian',
  last_name: 'Placeholder',
  email: 'Adrian@email.com',
  password: 'password',
  display_name: 'Adrian',
  avatar_url: 'https://avatars.githubusercontent.com/u/139060899?v=4',
  banner_url: 'https://wallpapercave.com/wp/wp11903020.jpg',
  address: 'Kerkstraat, Amsterdam',
  instruments: [ Instrument.find_by(name: "vocals"), Instrument.find_by(name: "guitar") ],
  genres: [Genre.order("RANDOM()").first],
  tagline: TAGLINE[1],
  bio: BIO[1]
)
User.create!(
  first_name: 'Aleem',
  last_name: 'Placeholder',
  email: 'Aleem@email.com',
  password: 'password',
  display_name: 'Aleem',
  avatar_url: 'https://avatars.githubusercontent.com/u/28513224?v=4',
  banner_url: 'https://wallpapercave.com/wp/wp10347654.jpg',
  address: 'Staalmeesterslaan, Amsterdam',
  instruments: [ Instrument.find_by(name: "saxophone"), Instrument.find_by(name: "vocals") ],
  genres: [Genre.order("RANDOM()").first],
  tagline: TAGLINE[2],
  bio: BIO[2]
)
User.create!(
  first_name: 'Callum',
  last_name: 'Placeholder',
  email: 'Callum@email.com',
  password: 'password',
  display_name: 'Callum',
  avatar_url: 'https://avatars.githubusercontent.com/u/116356064?v=4',
  banner_url: 'https://wallpapercave.com/wp/wp3454635.jpg',
  address: 'Gibboneiland, Amsterdam',
  instruments: [ Instrument.find_by(name: "harmonica"), Instrument.find_by(name: "guitar") ],
  genres: [Genre.order("RANDOM()").first],
  tagline: "Speaking the language of music - do you want to have a chat?",
  bio: BIO[3]
)
User.create!(
  first_name: 'Caroline',
  last_name: 'Placeholder',
  email: 'Caroline@email.com',
  password: 'password',
  display_name: 'Caroline',
  avatar_url: 'https://avatars.githubusercontent.com/u/138127305?v=4',
  banner_url: 'https://wallpapercave.com/wp/wp4134869.jpg',
  address: 'Thomas van Erpehof, Amsterdam',
  instruments: [ Instrument.find_by(name: "mandolin"), Instrument.find_by(name: "trombone") ],
  genres: [Genre.order("RANDOM()").first],
  tagline: "They say goldfish have no memory. I guess their lives are much like mine",
  bio: "I'm an eclectic person with electic taste. I love all sorts of music and playing it is a great hobby - listening too! Looking forward to finding jam buddies!"
)
Audio.create(url: "https://www.mixcloud.com/widget/iframe/?hide_cover=1&mini=1&light=1&feed=%2Fogataken%2Fjapanese-mellow-ska-mix%2F", user_id: User.last.id)
User.create!(
  first_name: 'Cristian',
  last_name: 'Placeholder',
  email: 'Cristian@email.com',
  password: 'password',
  display_name: 'Cristian',
  avatar_url: 'https://avatars.githubusercontent.com/u/138874915?v=4',
  banner_url: 'https://wallpapercave.com/wp/wp4135070.jpg',
  address: 'Javastraat, Amsterdam',
  instruments: [ Instrument.find_by(name: "oboe"), Instrument.find_by(name: "harp") ],
  genres: [Genre.order("RANDOM()").first],
  tagline: TAGLINE[5],
  bio: BIO[5]
)
User.create!(
  first_name: 'Daniele',
  last_name: 'Placeholder',
  email: 'Daniele@email.com',
  password: 'password',
  display_name: 'Daniele',
  avatar_url: 'https://avatars.githubusercontent.com/u/79024584?v=4',
  banner_url: 'https://wallpapercave.com/wp/wp4136074.jpg',
  address: 'Leliegracht, Amsterdam',
  instruments: [ Instrument.find_by(name: "zither"), Instrument.find_by(name: "piano") ],
  genres: [Genre.order("RANDOM()").first],
  tagline: TAGLINE[6],
  bio: BIO[6]
)
User.create!(
  first_name: 'Francesco',
  last_name: 'Placeholder',
  email: 'Francesco@email.com',
  password: 'password',
  display_name: 'Francesco',
  avatar_url: 'https://avatars.githubusercontent.com/u/5818940?v=4',
  banner_url: 'https://wallpapercave.com/wp/HTiPvGX.jpg',
  address: 'Voorburgstraat, Amsterdam',
  instruments: [ Instrument.find_by(name: "guitar"), Instrument.find_by(name: "harmonica") ],
  genres: [Genre.order("RANDOM()").first],
  tagline: "I hope you like jammin' too!",
  bio: "Anything from Classic Rock all the way to Fusion Funk, as long as the guitars are singing I'm gonna love it. Nothing beats a nice jam in the park!"
)
Audio.create(url: 'https://www.mixcloud.com/widget/iframe/?hide_cover=1&mini=1&feed=%2FDrJimmy%2Fdr-jimmy-jazzs-guitar-greats-the-lost-set%2F', user_id: User.last.id)

User.create!(
  first_name: 'Marius',
  last_name: 'Placeholder',
  email: 'Marius@email.com',
  password: 'password',
  display_name: 'Marius',
  avatar_url: 'https://avatars.githubusercontent.com/u/138881754?v=4',
  banner_url: 'https://wallpapercave.com/wp/wp4132920.jpg',
  address: 'Lindengracht, Amsterdam',
  instruments: [ Instrument.find_by(name: "triangle"), Instrument.find_by(name: "accordion") ],
  genres: [Genre.order("RANDOM()").first],
  tagline: TAGLINE[8],
  bio: BIO[8]
)
User.create!(
  first_name: 'Matheus',
  last_name: 'Placeholder',
  email: 'Matheus@email.com',
  password: 'password',
  display_name: 'Matheus',
  avatar_url: 'https://avatars.githubusercontent.com/u/78371638?v=4',
  banner_url: 'https://wallpapercave.com/wp/wp4133097.jpg',
  address: 'Ribesstraat, Amsterdam',
  instruments: [ Instrument.find_by(name: "keyboard"), Instrument.find_by(name: "bongo") ],
  genres: [Genre.order("RANDOM()").first],
  tagline: TAGLINE[9],
  bio: BIO[9]
)
User.create!(
  first_name: 'Nancy',
  last_name: 'Placeholder',
  email: 'Nancy@email.com',
  password: 'password',
  display_name: 'Nancy',
  avatar_url: 'https://avatars.githubusercontent.com/u/64468956?v=4',
  banner_url: 'https://wallpapercave.com/wp/wp4134229.jpg',
  address: 'Zeedijk, Amsterdam',
  instruments: [ Instrument.find_by(name: "xylophone"), Instrument.find_by(name: "piano") ],
  genres: [Genre.order("RANDOM()").first],
  tagline: TAGLINE[10],
  bio: BIO[10]
)
User.create!(
  first_name: 'Nathan',
  last_name: 'Placeholder',
  email: 'Nathan@email.com',
  password: 'password',
  display_name: 'Nathan',
  avatar_url: 'https://ca.slack-edge.com/T02NE0241-U05FRFGF7K9-d997ff9f3224-512',
  banner_url: 'https://wallpapercave.com/wp/wp4132927.jpg',
  address: 'Admiraal de Ruijterweg, Amsterdam',
  instruments: [ Instrument.find_by(name: "bagpipes"), Instrument.find_by(name: "snare") ],
  genres: [Genre.order("RANDOM()").first],
  tagline: TAGLINE[11],
  bio: BIO[11]
)
User.create!(
  first_name: 'Prachi',
  last_name: 'Placeholder',
  email: 'Prachi@email.com',
  password: 'password',
  display_name: 'Prachi',
  avatar_url: 'https://avatars.githubusercontent.com/u/126870650?v=4',
  banner_url: 'https://wallpapercave.com/wp/wp2832280.jpg',
  address: 'Koninginneweg, Amsterdam',
  instruments: [ Instrument.find_by(name: "cello"), Instrument.find_by(name: "flute") ],
  genres: [Genre.order("RANDOM()").first],
  tagline: TAGLINE[12],
  bio: BIO[12]
)
User.create!(
  first_name: 'Sophia',
  last_name: 'Placeholder',
  email: 'Sophia@email.com',
  password: 'password',
  display_name: 'Sophia',
  avatar_url: 'https://avatars.githubusercontent.com/u/138873317?v=4',
  banner_url: 'https://wallpapercave.com/wp/wp4135219.jpg',
  address: 'Valschermkade, Amsterdam',
  instruments: [ Instrument.find_by(name: "ocarina"), Instrument.find_by(name: "vocals") ],
  genres: [Genre.order("RANDOM()").first],
  tagline: TAGLINE[13],
  bio: BIO[13]
)

puts "#{User.count} profiles created"
