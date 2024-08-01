admin_user = AdminUser.new(
  first_name: 'Jon',
  last_name: 'Snow',
  email: 'admin@ordersnow.com',
  password: '112358P@ssw0rd',
  password_confirmation: '112358P@ssw0rd'
)
admin_user.skip_confirmation!
admin_user.save

#---------------------------------------------
# Normal Users

normal_user_one = NormalUser.new(
  first_name: 'Francisco Manuel',
  last_name: 'Peña Baraibar',
  email: 'fpena@itcrowd.dev',
  password: '112358',
  password_confirmation: '112358'
)

normal_user_one.skip_confirmation!
normal_user_one.save

Address.create({
  normal_user: normal_user_one,
  name: 'Casa',
  address_line: 'Calle 480 5223',
  city: 'City Bell',
  state: 'Buenos Aires',
  postal_code: '1896',
  latitude: -34.9182018,
  longitude: -57.9622415
})

#---------------------------------------------
# Locations

starbucks_la_plata = Location.create({
  name: 'Starbucks Coffee - La Plata',
  address: 'Calle 50 534, B1900ASV, B1900ASV La Plata, Provincia de Buenos Aires',
  phone_number: '08001220129',
  latitude: -34.9180351,
  longitude: -57.9544845
})

starbucks_caba = Location.create({
    name: "Starbucks",
    address: "Av. Corrientes 5347, C1414 AJG, Cdad. Autónoma de Buenos Aires",
    phone_number: "08001220129",
    latitude: -34.593699435320296,
    longitude: -58.44051983177086
  })

martinez_caba = Location.create({
    name: "Café Martínez",
    address: "Av. Santa Fe 1796, C1123 CABA, Buenos Aires",
    phone_number: "+541148188208",
    latitude: -34.589160,
    longitude: -58.396130
  })

havanna_caba = Location.create({
    name: "Havanna",
    address: "Av. Callao 1015, C1023 AAP, CABA, Buenos Aires",
    phone_number: "+541148191820",
    latitude: -34.596292,
    longitude: -58.397791
  })

shelter_caba = Location.create({
    name: "The Shelter Coffee",
    address: "Thames 1678, C1414DDH, CABA, Buenos Aires",
    phone_number: "+541148337257",
    latitude: -34.586466,
    longitude: -58.434658
  })

lab_caba = Location.create({
    name: "LAB Tostadores de Café",
    address: "Palestina 1302, C1182ADT, CABA, Buenos Aires",
    phone_number: "+541120475450",
    latitude: -34.609838,
    longitude: -58.425706
  })

#---------------------------------------------
# Product Categories

cafes_calientes = ProductCategory.create({
  name: 'Cafés Calientes',
  location: starbucks_la_plata
})

cafes_helados = ProductCategory.create({
  name: 'Cafés Helados',
  location: starbucks_la_plata
})

#---------------------------------------------
# Products

Product.create({
  name: 'Moka',
  description: 'Café espresso con chocolate y leche al vapor.',
  price: rand(1100..3200),
  available: true,
  location: starbucks_la_plata,
  product_category: cafes_calientes
})

Product.create({
  name: 'Vainilla Latte',
  description: 'Café espresso con leche al vapor y toques de vainilla.',
  price: rand(1100..3200),
  available: true,
  location: starbucks_la_plata,
  product_category: cafes_calientes
})

Product.create({
  name: 'Latte',
  description: 'Café espresso con leche vaporizada.',
  price: rand(1100..3200),
  available: true,
  location: starbucks_la_plata,
  product_category: cafes_calientes
})

Product.create({
  name: 'Dulce de leche Latte',
  description: 'Café espresso con dulce de leche, leche al vapor con crema batida y salsa de caramelo.',
  price: rand(1100..3200),
  available: true,
  location: starbucks_la_plata,
  product_category: cafes_calientes
})

Product.create({
  name: 'Cappuccino',
  description: 'Café espresso, leche vaporizada y abundante espuma de leche.',
  price: rand(1100..3200),
  available: true,
  location: starbucks_la_plata,
  product_category: cafes_calientes
})

Product.create({
  name: 'Flat White',
  description: 'Shots de café ristretto con leche vaporizada que finaliza con un punto dibujado en la superficie.',
  price: rand(1100..3200),
  available: true,
  location: starbucks_la_plata,
  product_category: cafes_calientes
})

Product.create({
  name: 'Americano',
  description: 'Café espresso combinado con agua al mejor estilo americano.',
  price: rand(1100..3200),
  available: true,
  location: starbucks_la_plata,
  product_category: cafes_calientes
})

Product.create({
  name: 'Latte Macchiato',
  description: 'Leche vaporizada con shots de café espresso que finaliza con un punto dibujado en la superficie.',
  price: rand(1100..3200),
  available: true,
  location: starbucks_la_plata,
  product_category: cafes_calientes
})

Product.create({
  name: 'Skinny Caramel Macchiato',
  description: 'Vainilla sin azucar y leche "manchada" con espresso, finalizada con el característico dibujo de caramelo.',
  price: rand(1100..3200),
  available: true,
  location: starbucks_la_plata,
  product_category: cafes_calientes
})

Product.create({
  name: 'Caramel Macchiato',
  description: 'Vainilla y leche "manchada" con espresso, finalizada con el característico dibujo de caramelo.',
  price: rand(1100..3200),
  available: true,
  location: starbucks_la_plata,
  product_category: cafes_calientes
})

Product.create({
  name: 'Mocha Blanco',
  description: 'Chocolate blanco, shots de Espresso y leche vaporizada, con crema batida.',
  price: rand(1100..3200),
  available: true,
  location: starbucks_la_plata,
  product_category: cafes_calientes
})

Product.create({
  name: 'Mocha',
  description: 'Chocolate con café espresso y leche al vapor, con crema batida.',
  price: rand(1100..3200),
  available: true,
  location: starbucks_la_plata,
  product_category: cafes_calientes
})

Product.create({
  name: 'Café del día con leche',
  description: 'Nuestras mezclas únicas de café en granos preparadas en sistema de filtrado, con una capa de leche vaporizada.',
  price: rand(1100..3200),
  available: true,
  location: starbucks_la_plata,
  product_category: cafes_calientes
})

Product.create({
  name: 'Café del día',
  description: 'Nuestras mezclas únicas de café en granos preparadas en sistema de filtrado.',
  price: rand(1100..3200),
  available: true,
  location: starbucks_la_plata,
  product_category: cafes_calientes
})

Product.create({
  name: 'Avellana Shaken Espresso con Avena Helado',
  description: 'Café Espresso batido con jarabe de avellana y cubierto con bebida de avena.',
  price: rand(1100..3200),
  available: true,
  location: starbucks_la_plata,
  product_category: cafes_helados
})

Product.create({
  name: 'Chocolate Shaken Espresso con Avena Helado',
  description: 'Café Espresso batido con salsa mocha y cubierto con bebida de avena.',
  price: rand(1100..3200),
  available: true,
  location: starbucks_la_plata,
  product_category: cafes_helados
})

Product.create({
  name: 'Skinny Caramel Macchiato Helado',
  description: 'Hielo, vainilla sin azúcar y leche descremada "manchada" con espresso, finalizada con el característico dibujo de caramelo.',
  price: rand(1100..3200),
  available: true,
  location: starbucks_la_plata,
  product_category: cafes_helados
})

Product.create({
  name: 'Caramel Macchiato Helado',
  description: 'Hielo, vainilla y leche "manchada" con espresso, finalizada con el característico dibujo de caramelo.',
  price: rand(1100..3200),
  available: true,
  location: starbucks_la_plata,
  product_category: cafes_helados
})

Product.create({
  name: 'Cappuccino Helado',
  description: 'El balance perfecto entre nuestro café espresso, hielo, leche y abundante espuma de leche.',
  price: rand(1100..3200),
  available: true,
  location: starbucks_la_plata,
  product_category: cafes_helados
})

Product.create({
  name: 'Skinny Vainilla Latte Helado',
  description: 'Delicioso café espresso con leche descremada, hielo y toques de vainilla sin azúcar.',
  price: rand(1100..3200),
  available: true,
  location: starbucks_la_plata,
  product_category: cafes_helados
})

Product.create({
  name: 'Latte Helado',
  description: 'Deliciosa combinación de café espresso con hielo y leche.',
  price: rand(1100..3200),
  available: true,
  location: starbucks_la_plata,
  product_category: cafes_helados
})

Product.create({
  name: 'Vainilla Latte Helado',
  description: 'Delicioso café espresso con leche, hielo y dulces toques de vainilla.',
  price: rand(1100..3200),
  available: true,
  location: starbucks_la_plata,
  product_category: cafes_helados
})

Product.create({
  name: 'Dulce de Leche Latte Helado',
  description: 'Café espresso con delicioso dulce de leche, hielo y leche con un remolino de crema batida y salsa de caramelo.',
  price: rand(1100..3200),
  available: true,
  location: starbucks_la_plata,
  product_category: cafes_helados
})

Product.create({
  name: 'Cold Brew Cold Foam',
  description: 'Bebida helada a base de granos de café colombianos infusionados por 20 horas coronada con una cremosa espuma de leche fría.',
  price: rand(1100..3200),
  available: true,
  location: starbucks_la_plata,
  product_category: cafes_helados
})

Product.create({
  name: 'Sweet Vainilla Cold Brew',
  description: 'Bebida helada a base de granos de café colombianos infusionados por 20 horas, endulzada con vainilla y finalizada con crema de leche.',
  price: rand(1100..3200),
  available: true,
  location: starbucks_la_plata,
  product_category: cafes_helados
})

Product.create({
  name: 'Cold Brew',
  description: 'Bebida helada a base de granos de café colombianos infusionados por 20 horas.',
  price: rand(1100..3200),
  available: true,
  location: starbucks_la_plata,
  product_category: cafes_helados
})

Product.create({
  name: 'Americano Helado',
  description: 'Delicioso café espresso combinado con agua y hielo, al mejor estilo americano.',
  price: rand(1100..3200),
  available: true,
  location: starbucks_la_plata,
  product_category: cafes_helados
})

Product.create({
  name: 'Mocha Blanco Helado',
  description: 'Irresistible combinación de chocolate blanco, shots de espresso, hielo y leche, coronado con crema batida.',
  price: rand(1100..3200),
  available: true,
  location: starbucks_la_plata,
  product_category: cafes_helados
})

Product.create({
  name: 'Mocha Helado',
  description: 'Intenso chocolate con café espresso, hielo y leche, coronado con crema batida.',
  price: rand(1100..3200),
  available: true,
  location: starbucks_la_plata,
  product_category: cafes_helados
})

Product.create({
  name: 'Café del día con Leche Helado',
  description: 'Nuestros exquisitos y selectos granos de café preparados en método filtrado y agregado de hielo para una infusión refrescante.',
  price: rand(1100..3200),
  available: true,
  location: starbucks_la_plata,
  product_category: cafes_helados
})

Product.create({
  name: 'Café del día Helado',
  description: 'Nuestros exquisitos y selectos granos de café preparados en método filtrado.',
  price: rand(1100..3200),
  available: true,
  location: starbucks_la_plata,
  product_category: cafes_helados
})
