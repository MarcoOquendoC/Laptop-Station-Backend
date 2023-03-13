Item.destroy_all

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
    description: "Experience seamless connectivity with the HP Envy 17.3. Combine the creative power of your devices with HP Palette. With a large 17.3 color-calibrated display, you get accurate colors. Plus, it has the Intel® Processor[1] to handle what you throw at it. Look and sound your best on video calls with a 5MP camera[2] with Auto Frame and AI Noise Reduction.",
    brand: "HP"
  },
  {
    title: "ThinkPad E15 4ta Gen",
    item_model: "21E7S1AM00",
    serial_n: "00000_000_0000000",
    image: "https://limalocal.com/laptopstation/images/default.pngpotencia y el rendimiento, la laptop ThinkPad E15 de 4ta generación te permite hacer las cosas en cualquier lugar. Equipado con hasta procesadores Intel® Core™ i7 de 12va generación con hasta 40 GB de memoria, puede procesar las cargas de trabajo más pesadas. También tiene la opción de conectividad WiFi 6E*, para acceder a Internet más rápido.",
    brand: "Lenovo"
  }
])

p "Created #{Item.count} items"
