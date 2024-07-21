class AITransactionModel {
  final String name;
  final String status;
  final String description;
  final String operationType;
  final double balance;
  final String currency;

  AITransactionModel({
    required this.name,
    required this.status,
    required this.description,
    required this.operationType,
    required this.balance,
    required this.currency,
  });

  factory AITransactionModel.fromMap(Map<String, dynamic> map) {
    return AITransactionModel(
      name: map['name'],
      status: map['status'],
      description: map['description'],
      operationType: map['operationType'],
      balance: map['balance'].toDouble(),
      currency: map['currency'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'status': status,
      'description': description,
      'operationType': operationType,
      'balance': balance,
      'currency': currency,
    };
  }
}
