require "open-uri"

10.times do |i|
    print "Seeding." +  ("." * (i % 3)) + "  \r"
    sleep(0.2)
end

puts " "

puts 'Cleaning up database'
Boat.destroy_all
puts 'Database is cleaned'

10.times do |i|
    print "Creating some new nice Boats." +  ("." * (i % 3)) + "  \r"
    sleep(0.2)
end

puts " "

files = [
  'https://www.bavariayachts.com/fileadmin/_processed_/f/8/csm_bavaria-sy-cline-c42-interior-02_bd508e7f7f.jpg',
  'https://www.bavariayachts.com/fileadmin/_processed_/1/1/csm_bavaria-sy-cline-c42-exterior-image-01_686d32e4a7.jpg',
  'https://www.wolf-angelsport.de/out/pictures/master/product/1/fox-fx--240-inflatable-boats-wolf-angelsport.jpg',
  'https://www.berlin-bootsverleih.com/photos/boats/geilezeit-partytours/primary_thumb.jpg',
  'https://q-cf.bstatic.com/images/hotel/max1024x768/178/178766063.jpg',
  'https://www.seehaus.immobilien/content/index/62cf0145ce59a7271cb96e0d472dbc966170bc89.jpeg',
  'https://i.pinimg.com/originals/15/0b/ff/150bffc448183c9a3bf2c7120af70518.jpg',
  'https://i.pinimg.com/originals/c7/5a/af/c75aaf0ed67f697d3b9e260f901c8958.jpg',
  'https://r-cf.bstatic.com/images/hotel/max500/104/104447609.jpg',
  'https://excellenceriviera.com/wp-content/uploads/2020/05/Fjord-40-Featured.jpg',
  'https://q-cf.bstatic.com/images/hotel/max1024x768/664/66467380.jpg',
  'https://3brefc126v633i9r4zk9q3p5-wpengine.netdna-ssl.com/wp-content/uploads/2019/07/MGR00244-1920x1280.jpg',
  'https://media.spacebase.com/media/cache/spaces/2442/tfo_seminarboot_wellenlaenge_2_1280.jpg',
  'https://media-cdn.tripadvisor.com/media/photo-s/12/53/31/40/enjoy-a-picnic-while.jpg',
  'https://media.tacdn.com/media/attractions-splice-spp-674x446/07/3b/0e/20.jpg',
]

locations = [
  'Am Riegelberg, 14542 Werder (Havel)',
  'Caputh, 14548 Schwielowsee',
  'Tornowstraße 15-3, 14473 Potsdam',
  'Potsdam-West, 14471 Potsdam',
  'Schwanenwerder, 14129 Berlin',
  'Str. 548 6, 12589 Berlin',
  'Bachstelzenweg 469-461, 12589 Berlin',
  'Hessenwinkel, 12589 Berlin',
  'Karpfenteich,14059 Berlin',
  'Spandauer Havelpromenade, 13599 Berlin',
  'Haselhorst, 13599 Berlin',
  'Eiswerder, 13585 Berlin',
  'Eiswerderufer 1, 13585 Berlin',
  'Pionierinsel, 13585 Berlin',
  'Floating University Berlin',
  'Hauptstraße 13, 10317 Berlin',
  'Friedhof der Kirchengemeinde Zwingli-Stralau, 10245 Berlin',
  'Berliner Innenstadt, 12045 Berlin',
  'Frieda-Arnheim-Promenade 36, 13585 Berlin ',
  'Mahnkopfweg 14-7, 13595 Berlin ',
]
20.times do
  boat = Boat.create(
    name: Faker::Name.female_first_name,
    location: locations.sample,
    capacity: [2, 4, 6].sample,
    price: rand(70..1000),
    category: ['Sailingboat', 'Motorboat'].sample,
    user_id: User.all.sample.id,
    )
  file = URI.open(files.sample)
  boat.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  puts "Boat #{boat.id} was created"
end

puts "Done, ready to sail"
