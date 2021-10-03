class Launches {
  final String missionName;
  final String? details;
  final List<String> urlImage;

  Launches({
    required this.missionName,
    required this.details,
    required this.urlImage,
  });

  Launches.fromJson(Map<String, dynamic> json)
      : missionName = json['mission_name'] as String,
        details = json['details'] ?? null,
        urlImage = List.from(json['links']['flickr_images']);
}
