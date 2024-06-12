class JobOfferBudget{

  final String id;
  final int amount;
  final String datePaid;
  final bool isPaid;

  JobOfferBudget({
    required this.id,
    required this.amount,
    required this.datePaid,
    required this.isPaid,

  });

  factory JobOfferBudget.fromJson(Map<String, dynamic> json) {
    return JobOfferBudget(
      id: json['id'],
      amount: json['amount'],
      datePaid: json['datePaid'],
      isPaid: json['isPaid'],
    );
  }
}