
import 'JobOfferBudget.dart';



class JobOffer{

  final String id;

  final String title;

  final String description;

  final bool blocked;

  final String image;

  final DateTime datePosted;

  final String jobOfferStatus;

  final int realisationTime;

  final DateTime dateStarted;

  final JobOfferBudget jobOfferBudget;

  final int likeCounts;

  final int commentCounts;

  final int applicationCounts;

  final int deliverableCounts;


  JobOffer({
    required this.id,
    required this.title,
    required this.description,
    required this.blocked,
    required this.image,
    required this.datePosted,
    required this.jobOfferStatus,
    required this.realisationTime,
    required this.dateStarted,
    required this.jobOfferBudget,
    required this.likeCounts,
    required this.commentCounts,
    required this.applicationCounts,
    required this.deliverableCounts
  });

  factory JobOffer.fromJson(Map<String, dynamic> json) {
    return JobOffer(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        blocked: json['blocked'],
        image: json['image'],
        datePosted: json['datePosted'],
        jobOfferStatus: json['jobOfferStatus'],
        realisationTime: json['realisationTime'],
        dateStarted: json['dateStarted'],
        jobOfferBudget: json['jobOfferBudget'],
        likeCounts: json['likeCounts'],
        commentCounts: json['commentCounts'],
        applicationCounts: json['applicationCounts'],
        deliverableCounts: json['deliverableCounts']
    );


  }

}









