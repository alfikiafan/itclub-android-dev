class TourismPlace {
  String name;
  String location;
  String description;
  String openDays;
  String openTime;
  String ticketPrice;
  String imageAsset;
  List<String> imageUrls;

  TourismPlace({
    required this.name,
    required this.location,
    required this.description,
    required this.openDays,
    required this.openTime,
    required this.ticketPrice,
    required this.imageAsset,
    required this.imageUrls,
  });
}

var tourismPlaceList = [
  TourismPlace(
    name: 'Keraton Kasunanan Surakarta',
    location: 'Baluwarti, Pasarkliwon',
    description:
        'Karaton Suråkartå Hadiningrat adalah Istana resmi Kesunanan Surakarta Hadiningrat yang terletak di Kota Surakarta. Keraton ini didirikan oleh Sri Susuhunan Pakubuwana II pada tahun 1744 sebagai pengganti Keraton Kartasura yang porak-poranda akibat Geger Pecinan pada tahun 1743.',
    openDays: 'Open Saturday-Thursday',
    openTime: '09:00 - 14:00',
    ticketPrice: 'Rp 10.000',
    imageAsset: 'images/Keraton_Kasunanan.jpeg',
    imageUrls: [
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/02/27/1d/58/der-innenhof.jpg?w=2400&h=-1&s=1',
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/14/5a/d7/fe/kraton-surakarta-hadiningrat.jpg?w=1400&h=-1&s=1',
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/12/27/e3/91/sam-6480-largejpg.jpg?w=800&h=-1&s=1'
    ],
  ),
  TourismPlace(
    name: 'The Heritage Palace',
    location: 'Kartasura, Sukoharjo',
    description:
        'Destinasi wisata ini merupakan bangunan tua bekas pabrik gula Colomadu yang dibangun oleh pemerintahan Belanda. Kini, setelah disulap oleh pemerintah Indonesia, bangunan ini menjadi tempat wisata sejarah yang menarik dan instagramable. The Heritage Palace kini menjadi salah satu destinasi wisata menarik dan favorit bagi masyarakat. Selain itu, menawarkan pemandangan taman, museum seni, dan ruang konvensi.',
    openDays: 'Open Everyday',
    openTime: '09:00 - 14:30',
    ticketPrice: 'Rp 55.000',
    imageAsset: 'images/The_Heritage_Palace.jpg',
    imageUrls: [
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/17/28/53/a2/scene-from-outdoor-balcony.jpg?w=800&h=-1&s=1',
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/17/28/53/8c/shadowy-wolf.jpg?w=800&h=-1&s=1',
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/17/28/53/55/arriving-at-heritage.jpg?w=800&h=-1&s=1',
    ],
  ),
  TourismPlace(
    name: 'Taman Balekambang',
    location: 'Manahan, Banjarsari',
    description:
        'Taman Balekambang adalah taman yang dibangun oleh KGPAA Mangkunegara VII untuk kedua putrinya, yaitu GRAy Partini dan GRAy Partinah. Selain itu, taman yang terbagi dua juga diberi nama sesuai dengan nama kedua putri, yaitu Partinah Bosch yang merupakan semacam hutan kota, dan Partini Tuin, yang merupakan kolam air.',
    openDays: 'Open Everyday',
    openTime: '07.00-17.00',
    ticketPrice: 'Free',
    imageAsset: 'images/Taman_Balekambang.jpg',
    imageUrls: [
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/09/00/7d/81/taman-balekambang.jpg?w=1000&h=-1&s=1',
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/09/00/7d/7b/taman-balekambang.jpg?w=1000&h=-1&s=1',
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/09/00/7d/6e/taman-balekambang.jpg?w=1000&h=-1&s=1',
    ],
  ),
  TourismPlace(
    name: 'Kampoeng Batik Laweyan',
    location: 'Laweyan, Laweyan',
    description:
        'Laweyan merupakan kawasan yang sangat terkenal sebagai pusat penghasil batik terbaik di Kota Solo dan sekitarnya. Kampung Batik Laweyan ini bahkan menjadi salah satu destinasi wisata di Solo yang paling ramai kunjungan wisatawan dari berbagai belahan dunia.',
    openDays: 'Open Everyday',
    openTime: '08:00 - 20:00',
    ticketPrice: 'Free',
    imageAsset: 'images/Kampoeng_Batik_Laweyan.jpg',
    imageUrls: [
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/78/42/6a/img20160811093925-largejpg.jpg?w=1600&h=-1&s=1',
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0b/99/07/02/salah-satu-stand-gallery.jpg?w=2000&h=-1&s=1',
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/78/42/6e/img20160811092508-largejpg.jpg?w=1600&h=-1&s=1',
    ],
  ),
  TourismPlace(
    name: 'Taman Sriwedari',
    location: 'Sriwedari, Laweyan',
    description:
    'Taman Sriwedari yang dulu dikenal sebagai Taman Raja ini berlokasi di Jalan Slamet Riyadi, No. 275, Kecamatan Lawedan, Kota Surakarta. Taman Sriwedari dibangun oleh Raja Kasunanan Surakarta, yaitu Sinuhun Pakubuwono X, sebagai tempat hiburan rakyat, abdi dalam, dan sentana dalem keraton.',
    openDays: 'Open Everyday',
    openTime: '24 hours',
    ticketPrice: 'Rp 7.000',
    imageAsset: 'images/Taman_Sriwedari.jpg',
    imageUrls: [
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/16/77/88/86/relief-on-the-gate.jpg?w=1400&h=-1&s=1',
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/16/77/88/8e/wayang-orang.jpg?w=700&h=-1&s=1',
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/11/05/55/03/taman-sriwedari-kota.jpg?w=2000&h=-1&s=1',
    ],
  ),
  TourismPlace(
    name: 'Waduk Cengklik',
    location: 'Ngemplak, Boyolali',
    description:
        'Waduk ini memiliki pemandangan Gunung Merapi dan Gunung Merbabu yang cantik, membuat waduk ini cocok untuk menjadi tempat wisata. Pengunjung juga dapat menyewa kapal untuk mengelilingi waduk ini sembari menikmati sepoi sepoi angin, memandangi kapal kapal kecil serta enceng gondok yang segar dan saat sore hari disuguhkan dengan siluet pemandangan dengan cahaya keemasan yang memanjakan mata. ',
    openDays: 'Open Everyday',
    openTime: '08.30-18.00',
    ticketPrice: '25.000',
    imageAsset: 'images/Waduk_Cengklik.jpg',
    imageUrls: [
      'https://garuda.industry.co.id/uploads/berita/detail/48841.jpg',
      'https://cdn-2.tstatic.net/travel/foto/bank/images/waduk-cengklik-park-di-boyolali-1.jpg',
      'https://asset.kompas.com/crops/dMEa6zu7tyxXXrQLzoKR5pW_5do=/0x0:780x520/750x500/data/photo/2019/06/20/3151082006.jpg',
    ],
  ),
  TourismPlace(
    name: 'The Lawu Park',
    location: 'Tawangmangu, Karanganyar',
    description:
        'The Lawu Park merupakan salah satu obyek wisata unggulan di Tawangmangu yang menyajikan destinasi wisata alam yang sering jadi incaran wisatawan. Hawa yang digin serta pemandangan yang asri menjadikan daya tarik sendiri dari obyek wisata The Lawu Park.',
    openDays: 'Open Everyday',
    openTime: '08.00 - 17.00',
    ticketPrice: 'Rp 20.000',
    imageAsset: 'images/The_Lawu_Park.jpg',
    imageUrls: [
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1d/d7/07/86/tempat-terbaik-untuk.jpg?w=1100&h=-1&s=1',
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1d/c2/c9/a2/the-lawu-park-pilihan.jpg?w=700&h=-1&s=1',
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1d/c2/c9/9f/the-lawu-park-pilihan.jpg?w=500&h=-1&s=1',
    ],
  ),
  TourismPlace(
    name: 'Grojogan Sewu',
    location: 'Tawangmangu, Karanganyar',
    description:
        'Grojogan Sewu merupakan air terjun yang memiliki tinggi sekitar 81 meter. Air terjun ini memiliki debit air yang cukup besar, airnya tetap mengalir banyak walaupun sedang musim kemarau. Maka dari itu, tidak heran jika air terjun ini dinamai Grojogan Sewu yang bermakna ribuan air yang mengalir ke bawah. Tempat wisata ini memiliki dua pintu masuk, yang satu berada di atas dan yang lainnya berada di bawah. Jika wisatawan masuk dari atas maka bisa menemukan kera-kera yang bergelantungan di pohon.',
    openDays: 'Open Everyday',
    openTime: '08.00 - 16.00',
    ticketPrice: 'Rp 20.000',
    imageAsset: 'images/Grojogan_Sewu.jpg',
    imageUrls: [
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0a/f9/b1/88/grojogan-sewu-waterfall.jpg?w=2000&h=-1&s=1',
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0a/f9/b1/6c/grojogan-sewu-waterfall.jpg?w=2000&h=-1&s=1',
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0a/f9/b1/0a/grojogan-sewu-waterfall.jpg?w=2000&h=-1&s=1',
    ],
  ),
  TourismPlace(
    name: 'Kebun Teh Kemuning',
    location: 'Ngargoyoso, Karanganyar',
    description:
        'Kebun Teh Kemuning berada di area dataran tinggi sejuk karanganyar. Berlokasi tak terlalu jauh dari kota solo, area perkebunan menawarkan sensasi wisata kebun teh yang unik. Karanganyar seolah menjadi daerah “puncak”-nya Jawa Tengah. Jika di Jawa Barat ada Bogor yang sering ramai kala liburan. Kebun Teh ini memiliki pemandangan indah hijau alami dengan hamparan tanaman teh dimana-mana. Tidak hanya itu, objek wisata ini juga menyediakan berbagai wahana dan spot foto yang menarik.',
    openDays: 'Open Everyday',
    openTime: '24 hours',
    ticketPrice: 'Free',
    imageAsset: 'images/Kebun_Teh_Kemuning.jpg',
    imageUrls: [
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0a/33/c2/79/kebun-teh-kemuning.jpg?w=2000&h=-1&s=1',
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1b/64/0e/46/kemuning-tea-plantation.jpg?w=1000&h=-1&s=1',
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1b/64/0e/3f/kemuning-tea-plantation.jpg?w=1000&h=-1&s=1',
    ],
  ),
];