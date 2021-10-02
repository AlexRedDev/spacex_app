class Launches {
  final String missionName;
  final String details;

  Launches({
    required this.missionName,
    required this.details,
  });

  Launches fromJson(Map<String, dynamic> json) {
    return Launches(
      missionName: json['mission_name'],
      details: json['details'],
    );
  }
}