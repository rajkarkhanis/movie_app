class Person {
  final int id;
  final double popularity;
  final String name;
  final String profileImage;
  final String knownFor;

  Person({
    this.id,
    this.popularity,
    this.name,
    this.profileImage,
    this.knownFor,
  });

  Person.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        popularity = json["popularity"],
        name = json["name"],
        profileImage = json["profile_path"],
        knownFor = json["known_for_department"];
}
