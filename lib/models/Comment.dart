import 'dart:io';



class Comment{
  final String id;
  final String userID;
  final String contenu;
  final String jobId;
  final DateTime datePosted;


  Comment({
    required this.id,
    required this.userID,
    required this.contenu,
    required this.jobId,
    required this.datePosted,


  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'],
      userID: json['userID'],
      contenu: json['contain'],
      jobId: json['jobId'],
      datePosted: json['datePosted'],
    );
  }
}
