

class Pack{

  final String id;
  final String name;
  final int priceOfSubscripion;
  final int maximumBudgetForJobPosting;
  final String description;
  final int numberOfDayDuration;

  Pack({
    required this.id,
    required this.name,
    required this.priceOfSubscripion,
    required this.maximumBudgetForJobPosting,
    required this.description,
    required this.numberOfDayDuration,

  });

  factory Pack.fromJson(Map<String, dynamic> json) {
    return Pack(
      id: json['id'],
      name: json['name'],
      priceOfSubscripion: json['priceOfSubscripion'],
      maximumBudgetForJobPosting: json['maximumBudgetForJobPosting'],
      description: json['description'],
      numberOfDayDuration: json['numberOfDayDuration'],
    );
  }
}