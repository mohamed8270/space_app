class MissionItem {
  final String name;
  final List<String> manufacturers;
  final List<String> payload;
  final String wikipedia;
  final String? twitter;
  final String website;
  final String description;

  MissionItem({
    required this.name,
    required this.manufacturers,
    required this.payload,
    required this.wikipedia,
    this.twitter,
    required this.website,
    required this.description,
  });

  factory MissionItem.fromJson(Map<String, dynamic> json) {
    var manufacturerFromJson = json['manufacturers'];
    var payloadFromJson = json['payload_ids'];
    List<String> manulist = manufacturerFromJson.cast<String>();
    List<String> paylist = payloadFromJson.cast<String>();
    return MissionItem(
      name: json['mission_name'],
      manufacturers: manulist,
      payload: paylist,
      wikipedia: json['wikipedia'],
      twitter: (json['twitter'] as String?)?.toString(),
      website: json['website'],
      description: json['description'],
    );
  }
}
