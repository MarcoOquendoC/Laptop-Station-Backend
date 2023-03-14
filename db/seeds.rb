Item.destroy_all
User.destroy_all

User.create! ([
  {email: 'test@test.com', password: 'password', first_name: 'Marcos', last_name: 'Gualtero'},
])

Item.create!([
  {
    title: 'ROG Strix SCAR 15',
    item_model: 'G532LW-AZ088T',
    serial_n: '00000_000_0000000',
    image: 'https://limalocal.com/laptopstation/images/default.png',
    description: 'Acelere el trabajo y el juego en una máquina diseñada para ofrecer velocidades de fotogramas de tres dígitos. ROG Boost mejora la GPU GeForce® RTX 2080 SUPER™ de vanguardia a 1560 MHz a 150 W en modo Turbo para un juego rápido y fluido. La poderosa décima generación CPU Intel® Core™ combinada con hasta 32 GB de segmentos de RAM DDR4-3200 a través del trabajo intensivo y el juego. Con 2 veloces SSD M.2 NVMe ejecutándose en RAID 0, cargando los tiempos se aceleran en todas sus aplicaciones y juegos. El espacio para un tercer SSD significa que usted puede expandir fácilmente su almacenamiento y llevar su biblioteca de programas completa a cualquier parte.',
    brand: 'Asus'
  },
  {
    title: "HP ENVY Laptop",
    item_model: "17-cr0747nr",
    serial_n: "00000_000_0000000",
    image: "https://limalocal.com/laptopstation/images/default.png",
    description: "Al combinar la durabilidad con la potencia y el rendimiento, la laptop ThinkPad E15 de 4ta generación te permite hacer las cosas en cualquier lugar. Equipado con hasta procesadores Intel® Core™ i7 de 12va generación con hasta 40 GB de memoria, puede procesar las cargas de trabajo más pesadas. También tiene la opción de conectividad WiFi 6E*, para acceder a Internet más rápido dondequiera que estés.",
    brand: "HP"
  },
  {
    title: "ThinkPad E15 4ta Gen",
    item_model: "21E7S1AM00",
    serial_n: "00000_000_0000000",
    image: "https://limalocal.com/laptopstation/images/default.png",
    description: "potencia y el rendimiento, la laptop ThinkPad E15 de 4ta generación te permite hacer las cosas en cualquier lugar. Equipado con hasta procesadores Intel® Core™ i7 de 12va generación con hasta 40 GB de memoria, puede procesar las cargas de trabajo más pesadas. También tiene la opción de conectividad WiFi 6E*, para acceder a Internet más rápido.",
    brand: "Lenovo"
  }
])

p "Created #{User.count} users"
p "Created #{Item.count} items"
