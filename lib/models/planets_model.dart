class PlanetsModel {
  final String name;
  final String tagline;
  final String taglineicn;
  final String picture;
  final String textureurl;
  final String description;
  final String disfromsun;
  final String yearlength;
  final double nummoons;
  final String namesake;
  final Rings rings;
  final String spacetxtureurl;

  PlanetsModel({
    required this.name,
    required this.tagline,
    required this.taglineicn,
    required this.picture,
    required this.textureurl,
    required this.description,
    required this.disfromsun,
    required this.yearlength,
    required this.nummoons,
    required this.namesake,
    required this.rings,
    required this.spacetxtureurl,
  });

  factory PlanetsModel.fromJson(Map<String, dynamic> json) {
    return PlanetsModel(
      name: json['name'],
      tagline: json['tagline'],
      taglineicn: json['tagline_icon'],
      picture: json['picture'],
      textureurl: json['textureUrl'],
      description: json['description'],
      disfromsun: json['distanceFromSun'],
      yearlength: json['yearLength'],
      nummoons: (json['numberOfMoons'] as num).toDouble(),
      namesake: json['namesake'],
      rings: Rings.fromJson(json['rings']),
      spacetxtureurl: json['spaceTexture_url'],
    );
  }
}

class Rings {
  final String? ringurl;

  Rings({this.ringurl});

  factory Rings.fromJson(Map<String, dynamic> json) {
    return Rings(
      ringurl: (json['url'] as String?)?.toString(),
    );
  }
}
