class Company {
  final int id;
  final String name;
  final String logo;
  final String country;

  Company(
    this.id,
    this.name,
    this.logo,
    this.country,
  );

  Company.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        logo = json['logo_path'],
        name = json['name'],
        country = json['origin_country'];
}
