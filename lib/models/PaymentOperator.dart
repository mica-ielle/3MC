

class PaymentOperator{

  final String id;
  final String name;
  final String description;
  final String retrievalFieldName ;
  final String retrievalFieldRegex;

  PaymentOperator({
    required this.id,
    required this.name,
    required this.description,
    required this.retrievalFieldName,
    required this.retrievalFieldRegex,

  });

  factory PaymentOperator.fromJson(Map<String, dynamic> json) {
    return PaymentOperator(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      retrievalFieldName: json['retrievalFieldName'],
      retrievalFieldRegex: json['retrievalFieldRegex'],
    );
  }
}