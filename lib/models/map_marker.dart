import 'package:latlong2/latlong.dart';
import 'package:mansau_sabah/models/spot.dart';

class MapMarker {
  final dynamic image;
  final dynamic title;
  final dynamic address;
  final dynamic location;
  final Spot spot;

  const MapMarker({
    required this.image,
    required this.title,
    required this.address,
    required this.location,
    required this.spot,
  });
}

final _locations = {
  LatLng(5.9823, 116.0763), //gayaStreet
  LatLng(5.9805, 116.0713), //anjung
  LatLng(5.9477, 116.0465), //tj.aru
  LatLng(5.9606, 116.0715), //muzium sabah,
  LatLng(5.98335, 116.20176), //mari-mari
  LatLng(5.9233, 116.0903), //kdca
  LatLng(5.88895, 116.07993), //monsopiad
  LatLng(5.84962, 116.07010), //lok kawi
  LatLng(5.91280, 116.10144), //dongs
  LatLng(5.90231, 116.13358), //hiking, inobong
  LatLng(5.72158, 116.07062), //mandalipau
  LatLng(5.76215, 116.03981), //kawang
  LatLng(5.74116, 115.96391), //bukit papar
  LatLng(5.74963, 116.08707), //deer
  LatLng(5.70474, 116.01815), //borneo culture village
  LatLng(6.21565, 116.26834), //rumah semut
  LatLng(6.15866, 116.17492), //taman buaya
  LatLng(6.19855, 116.22769), //lotud
  LatLng(6.065166400495063, 116.28075742878517), //kiulu
  LatLng(6.192451927294083, 116.18380419250138), //sabandar
  LatLng(5.90940, 116.13307) //pipin
};

const _path = 'assets/';

final mapMarkers = [
  MapMarker(
    image: '${_path}gayaStreet.JPG',
    title: 'Gaya Street',
    address: 'Gaya Street, Kota Kinabalu, 88000 Kota Kinabalu, Sabah',
    location: _locations.elementAt(0),
    spot: Spot(
      name: "Gaya Street Market",
      description:
          " A vibrant market that comes alive every Sunday transforming Gaya Street into a bustling hub of activity. ",
      imagePath: "assets/gayaStreet.JPG",
      category: SpotCategory.KotaKinabalu,
    ),
  ),
  MapMarker(
    image: '${_path}anjung.jpg',
    title: 'Anjung Kinabalu',
    address:
        'Jln Tun Fuad Stephens, Pusat Bandar Kota Kinabalu, 88000 Kota Kinabalu, Sabah',
    location: _locations.elementAt(1),
    spot: Spot(
      name: "Anjung Kinabalu",
      description:
          "A night market where you can find local cuisines and special souvenirs for a sweet memento of Sabah.",
      imagePath: "assets/anjung.jpg",
      category: SpotCategory.KotaKinabalu,
    ),
  ),
  MapMarker(
    image: '${_path}sunset.jpg',
    title: 'Tanjung Aru Beach',
    address: '88100 Kota Kinabalu, Sabah',
    location: _locations.elementAt(2),
    spot: Spot(
      name: "Tanjung Aru Beach",
      description:
          "A must-visit! Kota Kinabalu most-visited place, loved by locals and tourists for its breathtaking sunsets.",
      imagePath: "assets/sunset.jpg",
      category: SpotCategory.KotaKinabalu,
    ),
  ),
  MapMarker(
    image: '${_path}museum_sabah.jpg',
    title: 'Museum Sabah',
    address: 'sabah museum complex, Jalan Muzium, 88300 Kota Kinabalu, Sabah',
    location: _locations.elementAt(3),
    spot: Spot(
      name: "Museum Sabah",
      description:
          "Discover the fascinating heritage of Sabah as the museum offers a glimpse into the state diverse culture, traditions and history. ",
      imagePath: "assets/museum_sabah.jpg",
      category: SpotCategory.KotaKinabalu,
    ),
  ),
  MapMarker(
    image: '${_path}marimari.jpg',
    title: 'Mari-Mari Cultural Village',
    address: 'Jalan Kionsom, Inanam, 88450 Kota Kinabalu, Sabah',
    location: _locations.elementAt(4),
    spot: Spot(
      name: "Mari-Mari Cultural Village",
      description:
          "Experience and get to know Sabah's diverse ethnicity and culture where you get to learn in depth about our people.",
      imagePath: "assets/marimari.jpg",
      category: SpotCategory.KotaKinabalu,
    ),
  ),
  MapMarker(
      image: '${_path}kdca.jpg',
      title: 'Koisaan Cultural Village',
      address:
          '408, P, O Box, Hongkod Koisaan, KM. 8, Jalan Penampang, 89509 Penampang, Sabah',
      location: _locations.elementAt(5),
      spot: Spot(
        name: "KDCA Cultural Village",
        description:
            "A cultural village that offers a tour of unique design and interior of traditional houses that represent each big groups of ethnicity in Sabah.",
        imagePath: "assets/kdca.jpg",
        category: SpotCategory.Penampang,
      )),
  MapMarker(
    image: '${_path}monsopiad.jpg',
    title: 'Monsopiad Heritage Village',
    address:
        'Kampung Kuai Kandazon, Jalan Putatan Ramayah, 89507 Penampang, Sabah',
    location: _locations.elementAt(6),
    spot: Spot(
      name: "Monsopiad Cultural Village",
      description:
          "A fascinating place to learn about the history and culture of the Kadazan-Dusun people, one of the largest ethnic group in Malaysia.",
      imagePath: "assets/monsopiad.jpg",
      category: SpotCategory.Penampang,
    ),
  ),
  MapMarker(
    image: '${_path}zoo.jpg',
    title: 'Lok Kawi Wildlife Park',
    address: 'Lok kawi Putatan, 88200 Kota Kinabalu, Sabah',
    location: _locations.elementAt(7),
    spot: Spot(
      name: "Lok Kawi Wildlife Center",
      description:
          "A visit for to a zoo is always fun! Let's get to know the animals that live and exist around Sabah.",
      imagePath: "assets/zoo.jpg",
      category: SpotCategory.Penampang,
    ),
  ),
  MapMarker(
    image: '${_path}tamu.jpg',
    title: 'Tamu Donggongon',
    address:
        'Jalan Donggongon Kasigui, Pekan Donggongon, 89500 Donggongon, Sabah',
    location: _locations.elementAt(8),
    spot: Spot(
      name: "Tamu Donggongon",
      description:
          "Tamu is a traditional market located in the Donggongon Town where local people frequently visit for its fresh produce, delicious foods and local handicrafts. ",
      imagePath: "assets/tamu.jpg",
      category: SpotCategory.Penampang,
    ),
  ),
  MapMarker(
    image: '${_path}inobong.jpg',
    title: 'Inobong Substation Hiking Starting Location',
    address: '89500 Donggongon, Sabah',
    location: _locations.elementAt(9),
    spot: Spot(
      name: "Inobong Substation, Crocker Range Park",
      description:
          "One of the substations around Crocker Range Park where its trail has become a popular place for people who loves hiking.",
      imagePath: "assets/inobong.jpg",
      category: SpotCategory.Penampang,
    ),
  ),
  MapMarker(
    image: '${_path}mandalipau.jpg',
    title: 'Mandalipau White Water View & Fishpond',
    address: 'P3C9+HR, Papar, Sabah',
    location: _locations.elementAt(10),
    spot: Spot(
      name: "Mandalipau White Water View & Fishpond",
      description:
          "A perfect getaway place to enjoy time with family and friends by playing in the cold river creating lasting memories with loved ones.",
      imagePath: "assets/mandalipau.jpg",
      category: SpotCategory.Papar,
    ),
  ),
  MapMarker(
    image: '${_path}kawang.jpg',
    title: 'Hutan Lipur Kawang',
    address: 'Kampung Kawang, 89600 Papar, Sabah',
    location: _locations.elementAt(11),
    spot: Spot(
      name: "Kawang Forest Centre",
      description:
          "A stunning natural destination offering lush tropical forests, cool waterfalls and serene views, a place to be present with nature.",
      imagePath: "assets/kawang.jpg",
      category: SpotCategory.Papar,
    ),
  ),
  MapMarker(
    image: '${_path}hill.jpg',
    title: 'Starting Trail Bukit Bendera',
    address: 'Jalan Suok Dambai Nantazan, 89600 Papar, Sabah',
    location: _locations.elementAt(12),
    spot: Spot(
      name: "Bukit Pohumpung",
      description:
          "Pohumpung Hill is a great place for a short hike that offers natural breeze and beautiful view of the countryside.",
      imagePath: "assets/hill.jpg",
      category: SpotCategory.Papar,
    ),
  ),
  MapMarker(
    image: '${_path}deer.jpg',
    title: 'Mondikot Deer Camp',
    address: 'Kg Mondikot, 89600 Papar, Sabah',
    location: _locations.elementAt(13),
    spot: Spot(
      name: "Mondikot Deer Camp",
      description:
          "For those seeking a touch of modern comfort in the midst of outdoor living, this place is suitable for you to have your own me time.",
      imagePath: "assets/deer.jpg",
      category: SpotCategory.Papar,
    ),
  ),
  MapMarker(
    image: '${_path}bclPapar.jpg',
    title: 'Borneo Cultural Village',
    address: 'Jalan Kionsom, Inanam, 88450 Kota Kinabalu, Sabah',
    location: _locations.elementAt(14),
    spot: Spot(
      name: "Borneo Cultural Village",
      description:
          "Spend half-day in Borneo Cultural Village, Papar and experience the authentic traditions as well as traditional performances of Borneo.",
      imagePath: "assets/bclPapar.jpg",
      category: SpotCategory.Papar,
    ),
  ),
  MapMarker(
    image: '${_path}ant.jpg',
    title: 'MMari-Mari Cultural Village',
    address: 'Mai Aman, 89600 Papar, Sabah',
    location: _locations.elementAt(15),
    spot: Spot(
      name: "Borneo Ant House",
      description:
          "Enjoy an exciting time at the all-in-one educational mini-theme park featuringcaptivating exhibitions of arts, culture, and nature.",
      imagePath: "assets/ant.jpg",
      category: SpotCategory.Tuaran,
    ),
  ),
  MapMarker(
    image: '${_path}buaya.jpg',
    title: 'Tuaran Crocodile Farm',
    address: 'Unnamed Rd,, 89200 Tuaran, Sabah',
    location: _locations.elementAt(16),
    spot: Spot(
      name: "Tuaran Crocodile Farm",
      description:
          "Open-concept for a captivating reptile experience, offers Crocodile Shows, feeding observations, and educational programs.",
      imagePath: "assets/buaya.jpg",
      category: SpotCategory.Tuaran,
    ),
  ),
  MapMarker(
    image: '${_path}lotud.jpg',
    title: 'Linangkit Cultural Village',
    address: 'Sungai, 89150 Tuaran, Sabah',
    location: _locations.elementAt(17),
    spot: Spot(
      name: "Linangkit Cultural Village",
      description:
          "A village specifically focused on the Lotud people who is the main ethnic that lives in the Tuaran district.",
      imagePath: "assets/lotud.jpg",
      category: SpotCategory.Tuaran,
    ),
  ),
  MapMarker(
    image: '${_path}kiulu.jpg',
    title: 'Kiulu White Water Rafting Centre',
    address: 'Jalan Tamparuli Kiulu, 89250 Tamparuli, Sabah',
    location: _locations.elementAt(18),
    spot: Spot(
      name: "Kiulu White Water Rafting Centre",
      description:
          "An adventurous activity suitable for the families and young adults who want half a day of cool water fun.",
      imagePath: "assets/kiulu.jpg",
      category: SpotCategory.Tuaran,
    ),
  ),
  MapMarker(
    image: '${_path}kuda.jpg',
    title: 'Sabandar Cowboy Towne',
    address: 'Jalan Shah Sabandar Tuaran, 89200 Kota Kinabalu, Sabah',
    location: _locations.elementAt(19),
    spot: Spot(
      name: "Sabandar Cowboy Town",
      description:
          "A mini Wild West experience with horseback riding on the beach, exploring mangrove park, ride ATV and enjoy firefly cruises. ",
      imagePath: "assets/kuda.jpg",
      category: SpotCategory.Tuaran,
    ),
  ),
];
