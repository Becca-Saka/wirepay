class AccountInfoModel {
  final List<String> currencyIcons;
  final String title;
  final String description;
  final String buttonText;

  AccountInfoModel({
    required this.currencyIcons,
    required this.title,
    required this.description,
    required this.buttonText,
  });

  factory AccountInfoModel.fromMap(Map<String, dynamic> map) {
    return AccountInfoModel(
      currencyIcons: List<String>.from(map['currencyIcons']),
      title: map['title'],
      description: map['description'],
      buttonText: map['buttonText'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'currencyIcons': currencyIcons,
      'title': title,
      'description': description,
      'buttonText': buttonText,
    };
  }
}
