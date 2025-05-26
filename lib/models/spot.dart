// ignore_for_file: constant_identifier_names

class Spot {
  final String name;
  final String description;
  final String imagePath;
  final SpotCategory category;

  Spot({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.category,
  });
}

enum SpotCategory {
  // ignore: duplicate_ignore
  // ignore: constant_identifier_names
  KotaKinabalu,
  Tuaran,
  Penampang,
  Papar,
}
