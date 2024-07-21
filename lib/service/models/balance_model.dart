class BalanceData {
  final String icon;
  final String name;
  final double balance;
  final String currency;
  BalanceData({
    required this.icon,
    required this.name,
    required this.balance,
    required this.currency,
  });

  factory BalanceData.fromMap(Map<String, dynamic> json) {
    return BalanceData(
      icon: json['icon'],
      name: json['name'],
      balance: json['balance']?.toDouble(),
      currency: json['currency'],
    );
  }
}
