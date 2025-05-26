import 'package:flutter/material.dart';
import 'package:mansau_sabah/models/spot.dart';

class Guidebook extends ChangeNotifier {
  // list of spot menu
  final List<Spot> _menu = [
    // kota kinabalu
    Spot(
      name: "Tanjung Aru Beach",
      description:
          "A must-visit! Kota Kinabalu most-visited place, loved by locals and tourists for its breathtaking sunsets.",
      imagePath: "assets/sunset.jpg",
      category: SpotCategory.KotaKinabalu,
    ),
    Spot(
      name: "Museum Sabah",
      description:
          "Discover the fascinating heritage of Sabah as the museum offers a glimpse into the state diverse culture, traditions and history. ",
      imagePath: "assets/museum_sabah.jpg",
      category: SpotCategory.KotaKinabalu,
    ),
    Spot(
      name: "Gaya Street Market",
      description:
          " A vibrant market that comes alive every Sunday transforming Gaya Street into a bustling hub of activity. ",
      imagePath: "assets/gayaStreet.JPG",
      category: SpotCategory.KotaKinabalu,
    ),
    Spot(
      name: "Mari-Mari Cultural Village",
      description:
          "Experience and get to know Sabah's diverse ethnicity and culture where you get to learn in depth about our people.",
      imagePath: "assets/marimari.jpg",
      category: SpotCategory.KotaKinabalu,
    ),
    Spot(
      name: "Anjung Kinabalu",
      description:
          "A night market where you can find local cuisines and special souvenirs for a sweet memento of Sabah.",
      imagePath: "assets/anjung.jpg",
      category: SpotCategory.KotaKinabalu,
    ),

    //tuaran
    Spot(
      name: "Linangkit Cultural Village",
      description:
          "A village specifically focused on the Lotud people who is the main ethnic that lives in the Tuaran district.",
      imagePath: "assets/lotud.jpg",
      category: SpotCategory.Tuaran,
    ),
    Spot(
      name: "Borneo Ant House",
      description:
          "Enjoy an exciting time at the all-in-one educational mini-theme park featuringcaptivating exhibitions of arts, culture, and nature.",
      imagePath: "assets/ant.jpg",
      category: SpotCategory.Tuaran,
    ),
    Spot(
      name: "Tuaran Crocodile Farm",
      description:
          "Open-concept for a captivating reptile experience, offers Crocodile Shows, feeding observations, and educational programs.",
      imagePath: "assets/buaya.jpg",
      category: SpotCategory.Tuaran,
    ),
    Spot(
      name: "Sabandar Cowboy Town",
      description:
          "A mini Wild West experience with horseback riding on the beach, exploring mangrove park, ride ATV and enjoy firefly cruises. ",
      imagePath: "assets/kuda.jpg",
      category: SpotCategory.Tuaran,
    ),
    Spot(
      name: "Kiulu White Water Rafting Centre",
      description:
          "An adventurous activity suitable for the families and young adults who want half a day of cool water fun.",
      imagePath: "assets/kiulu.jpg",
      category: SpotCategory.Tuaran,
    ),

    //penampang
    Spot(
      name: "Monsopiad Cultural Village",
      description:
          "A fascinating place to learn about the history and culture of the Kadazan-Dusun people, one of the largest ethnic group in Malaysia.",
      imagePath: "assets/monsopiad.jpg",
      category: SpotCategory.Penampang,
    ),
    Spot(
      name: "Tamu Donggongon",
      description:
          "Tamu is a traditional market located in the Donggongon Town where local people frequently visit for its fresh produce, delicious foods and local handicrafts. ",
      imagePath: "assets/tamu.jpg",
      category: SpotCategory.Penampang,
    ),
    Spot(
      name: "Lok Kawi Wildlife Center",
      description:
          "A visit for to a zoo is always fun! Let's get to know the animals that live and exist around Sabah.",
      imagePath: "assets/zoo.jpg",
      category: SpotCategory.Penampang,
    ),
    Spot(
      name: "KDCA Cultural Village",
      description:
          "A cultural village that offers a tour of unique design and interior of traditional houses that represent each big groups of ethnicity in Sabah.",
      imagePath: "assets/kdca.jpg",
      category: SpotCategory.Penampang,
    ),
    Spot(
      name: "Inobong Substation, Crocker Range Park",
      description:
          "One of the substations around Crocker Range Park where its trail has become a popular place for people who loves hiking.",
      imagePath: "assets/inobong.jpg",
      category: SpotCategory.Penampang,
    ),

    //papar
    Spot(
      name: "Borneo Cultural Village",
      description:
          "Spend half-day in Borneo Cultural Village, Papar and experience the authentic traditions as well as traditional performances of Borneo.",
      imagePath: "assets/bclPapar.jpg",
      category: SpotCategory.Papar,
    ),
    Spot(
      name: "Kawang Forest Centre",
      description:
          "A stunning natural destination offering lush tropical forests, cool waterfalls and serene views, a place to be present with nature.",
      imagePath: "assets/kawang.jpg",
      category: SpotCategory.Papar,
    ),
    Spot(
      name: "Mandalipau White Water View & Fishpond",
      description:
          "A perfect getaway place to enjoy time with family and friends by playing in the cold river creating lasting memories with loved ones.",
      imagePath: "assets/mandalipau.jpg",
      category: SpotCategory.Papar,
    ),
    Spot(
      name: "Mondikot Deer Camp",
      description:
          "For those seeking a touch of modern comfort in the midst of outdoor living, this place is suitable for you to have your own me time.",
      imagePath: "assets/deer.jpg",
      category: SpotCategory.Papar,
    ),
    Spot(
      name: "Bukit Pohumpung",
      description:
          "Pohumpung Hill is a great place for a short hike that offers natural breeze and beautiful view of the countryside.",
      imagePath: "assets/hill.jpg",
      category: SpotCategory.Papar,
    ),
  ];

/* 

G e t t e r s

*/

  List<Spot> get menu => _menu;

/*

O p e r a t i o n s

*/

/*

helpers 

 */
}
