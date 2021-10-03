class Launches {
  final String missionName;
  final String? details;
  final String? urlImage;

  Launches({
    required this.missionName,
    required this.details,
    required this.urlImage,
  });

  Launches.fromJson(Map<String, dynamic> json)
      : missionName = json['mission_name'] as String,
        details = json['details'] ?? '',
        urlImage = json['links']['flickr_images'][0] ?? '';
}
