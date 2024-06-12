

class Like{

  final String id;
  final String jobId;
  final String userID;
  final bool statut;

  Like({
    required this.id,
    required this.jobId,
    required this.userID,
    required this.statut,

  });

  factory Like.fromJson(Map<String, dynamic> json) {
    return Like(
      id: json['id'],
      jobId: json['job_id'],
      userID: json['user_id'],
      statut: json['statut'],
    );
  }
}