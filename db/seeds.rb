# For now, this seeds do not create: chatrooms, user_chatrooms, messages, jams, user_jams, videos, audios, images, instruments and user_instrument.

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
User.destroy_all

# Dataset:
CITIES = ['Amsterdam', 'Den Haag', 'Utrecht', 'Leiden', 'Rotterdam'].freeze

CATEGORIES = %w[Vocal Keyboard String Percussion Wind].freeze

GENRES = ['Rock','Pop','Hip-hop','Jazz','Classical','Electronic','R&B','Country','Reggae','Metal', 'Ska'].freeze

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


DISPLAY_NAME = ["Rockstar",
  "Maestro",
  "Diva",
  "Crooner",
  "Guitar Hero",
  "Songbird",
  "Beatsmith",
  "Pianist",
  "Bard",
  "Fiddler",
  "Conductor",
  "Virtuoso",
  "Minstrel",
  "Jazz Cat",
  "Mozart of __ (genre)",
  "Harmonizer",
  "Troubadour",
  "Chanteuse",
  "Beatmaker",
  "Axeman",
  "Frontman/Frontwoman",
  "Siren",
  "Rapper",
  "Cellist",
  "Synth Wizard",
  "Harper",
  "Music Maverick",
  "Serenade Master",
  "Drum Machine"
].freeze

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

# FACES
AVATAR_URL = [
  'https://kitt.lewagon.com/placeholder/users/cveneziani',
  'https://kitt.lewagon.com/placeholder/users/arthur-littm',
  'https://kitt.lewagon.com/placeholder/users/sarahlafer',
  'https://kitt.lewagon.com/placeholder/users/krokrob'
].freeze

INSTRUMENTS_NAME = [
  "Acoustic Guitar", "Electric Guitar", "Piano", "Violin", "Flute",
  "Drum Kit", "Saxophone", "Trumpet", "Cello", "Clarinet",
  "Bass Guitar", "Trombone", "Harp", "Accordion", "Banjo",
  "Ukulele", "French Horn", "Xylophone", "Oboe", "Synthesizer",
  "Bagpipes", "Didgeridoo", "Mandolin", "Sitar", "Bongo Drums"
].freeze

BANNERS = [
  'https://www.chuppspianos.com/wp-content/uploads/2021/05/Steinway-Sons-Model-45-Upright-Vertical-Piano-356674-Art-Case-Crown-Jewel-Piano.jpg',
  'https://carusopianos.com/images/stories/virtuemart/product/yamaha_dgh1b_5319498_2__1682098959_400.jpg',
  'https://upload.wikimedia.org/wikipedia/commons/9/90/Boesendorfer-5075415.jpg',
  'https://img.kyodonews.net/english/public/images/posts/5c9687645d0afc13a3f8a7a0a41d0ea3/image_l.jpeg',
  'https://images.reverb.com/image/upload/s--D9BPS13I--/f_auto,t_supersize/v1617023779/pfoxkc1giu4fybagqvdy.jpg',
  'https://www.drumazon.com/cdn/shop/products/PEARL-MASTERWORKS-5-PIECE-DRUM-KIT-IRIDECENT-WHITE-SPARKLE-GOLD-HARDWARE-DRUMAZON_01_1024x1024.jpg?v=1600385701',
  'https://www.hornhospital.com/main/wp-content/uploads/Yamaha-0586.jpg',
  'https://i.ebayimg.com/images/g/mz0AAOSwQThhHEXh/s-l1200.jpg',
  'https://images.reverb.com/image/upload/s--FWsk9fMz--/f_auto,t_large/v1630085214/vtdgahn6j7coqbtg4dxr.jpg',
  'https://upload.wikimedia.org/wikipedia/commons/4/40/Andrea_Amati_violin_-_Met_Museum_NY.jpg?Amati1160988356',
  'https://cdn.shoplightspeed.com/shops/632400/files/38628731/holton-used-holton-h180-double-french-horn.jpg',
  'https://i.ebayimg.com/images/g/XqgAAOSwa~5kdrRK/s-l1200.webp',
  'https://zingendesnaar.nl/media/catalog/product/cache/1cda160bbd810bf3aa1b6126fd0b1bbc/s/a/salvi_diana_walnoot.jpg',
  'https://dirkwitte.nl/cdn/shop/products/DSC04103_1024x1024.jpg?v=1650974707',
  'https://www.woodstockguitars.dk/wp-content/uploads/2020/10/Fender_Stratocaster_Sunburst_1.jpg',
  'https://cdn.webshopapp.com/shops/229736/files/400505282/fender-fender-custom-shop-52-mod-journeyman-teleca.jpg',
  'https://www.stars-music.nl/medias/gibson/sg-standard-1961-faded-maestro-vibrola-original-2h-trem-rw-hd-7-192081.jpg',
  'https://max.guitars/media/catalog/product/cache/55c72fef4415145db30bd2dcfee62df6/a/r/art-20602_av_ii_66_jazz_bass_rw_wt3tb_art-20602-31173.jpg',
  'https://max.guitars/media/catalog/product/cache/55c72fef4415145db30bd2dcfee62df6/0/1/0190160806_fen_ins_frt_1_rr.jpg',
  'https://guitargeargiveaway.co.uk/wp-content/uploads/2023/03/Gibson-Thunderbird-Bass-in-Tobacco-Burst-01.jpg',
  'https://gsquid.b-cdn.net/wp-content/uploads/2022/04/Ibanez%20SR500%20(2).jpg',
  'https://dijkmansmuziek.nl/cdn/shop/files/IMG_6544_c51d7acb-3c0f-4d95-8e01-50af6c29659d.jpg?v=1686826798&width=480',
].freeze

# Admin user here, do not delete from seed
puts 'Making admin user...'
User.new(
  email: 'admin@email.com',
  password: 'password',
  first_name: 'Admin',
  last_name: 'Admin',
  display_name: 'Admin',
  adress: 'Amsterdam',
  bio: 'The admin...',
  tagline: 'Guess who admin stuff',
  avatar_url: AVATAR_URL.sample,
  banner_url: BANNERS.sample
).save

puts 'Creating users...'


# The following are normal users:
7.times do |i|
  User.new(
    email: "user#{i}@email.com",
    password: 'password',
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    display_name: DISPLAY_NAME.sample,
    adress: CITIES.sample,
    bio: BIO.sample,
    tagline: TAGLINE.sample,
    avatar_url: AVATAR_URL.sample,
    banner_url: BANNERS.sample
  ).save
end
