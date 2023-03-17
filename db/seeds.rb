Item.destroy_all
User.destroy_all
Reserve.destroy_all

User.create! ([
  {email: 'test@test.com', password: 'password', first_name: 'Marcos', last_name: 'Gualtero'},
  {email: 'test1@test.com', password: 'password', first_name: 'Josue', last_name: 'Benavides'},
])

Item.create!([
  {
    title: 'ROG Strix SCAR 15',
    item_model: 'G532LW-AZ088T',
    serial_n: '00000_000_0000000',
    image: 'https://limalocal.com/laptopstation/images/rog_strix.png',
    description: 'NVIDIA® GeForce RTX™ 4080 Laptop GPU. ROG Boost: 2330MHz* at 175W (2280MHz Boost Clock+50MHz OC, 150W+25W Dynamic Boost). 12GB GDDR6',
    brand: 'Asus'
  },
  {
    title: 'HP ENVY Laptop',
    item_model: '17-cr0747nr',
    serial_n: '00000_000_0000000',
    image: 'https://limalocal.com/laptopstation/images/hp_envy.png',
    description: 'HP Envy Laptop, 17.3" IPS Touchscreen, Intel Core i7-1255U, GeForce MX 550, Backlit Keyboard, Fingerprint Reader, Wi-Fi 6, Audio by Bang & Olufsen, Win 11 (32GB RAM | 1TB PCIe SSD)',
    brand: 'HP'
  },
  {
    title: 'ThinkPad E15 4ta Gen',
    item_model: '21E7S1AM00',
    serial_n: '00000_000_0000000',
    image: 'https://limalocal.com/laptopstation/images/thinkpade15.png',
    description: 'AMD Ryzen™ 7 5825U Processor (2.00 GHz up to 4.50 GHz). 15.6" FHD (1920 x 1080), IPS, Anti-Glare, Non-Touch, 45%NTSC, 300 nits, 60Hz, LED Backlight, Narrow Bezel',
    brand: "Lenovo"
  }
])

Reserve.create! ([
  {user_id: User.first.id, item_id: Item.first.id, date: '2023-03-01'},
  {user_id: User.first.id, item_id: Item.last.id, date: '2023-03-02'},
  {user_id: User.last.id, item_id: Item.first.id, date: '2023-03-03'},
  {user_id: User.last.id, item_id: Item.last.id, date: '2023-03-04'},
  {user_id: User.first.id, item_id: Item.first.id, date: '2023-03-01'},
  {user_id: User.first.id, item_id: Item.last.id, date: '2023-03-02'},
  {user_id: User.last.id, item_id: Item.first.id, date: '2023-03-03'},
  {user_id: User.last.id, item_id: Item.last.id, date: '2023-03-04'},
  {user_id: User.first.id, item_id: Item.first.id, date: '2023-03-01'},
  {user_id: User.first.id, item_id: Item.last.id, date: '2023-03-02'},
  {user_id: User.last.id, item_id: Item.first.id, date: '2023-03-03'},
  {user_id: User.last.id, item_id: Item.last.id, date: '2023-03-04'},
])

p "Created #{User.count} users"
p "Created #{Item.count} items"
p "Created #{Reserve.count} reserves"
