class InfoMission {
  final String roverName;
  final String landingDate;
  final String launchDate;
  final String missionStatus;
  final int maxSol;
  final String maxDate;
  final int totalPhotos;

  InfoMission({
    required this.roverName,
    required this.landingDate,
    required this.launchDate,
    required this.missionStatus,
    required this.maxSol,
    required this.maxDate,
    required this.totalPhotos,
  });

  factory InfoMission.fromJson(Map<String, dynamic> json) {
    return InfoMission(
      roverName: json['rover']['name'],
      landingDate: json['rover']['landing_date'],
      launchDate: json['rover']['launch_date'],
      missionStatus: json['rover']['status'],
      maxSol: json['rover']['max_sol'],
      maxDate: json['rover']['max_date'],
      totalPhotos: json['rover']['total_photos'],
    );
  }
}
