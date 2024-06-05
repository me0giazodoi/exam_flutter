class Place {
  final String name;
  final String description;
  final String imageUrl;

  Place({required this.name, required this.description, required this.imageUrl});

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      name: json['name'],
      description: json['description'],
      imageUrl: json['imageUrl'],
    );
  }
}