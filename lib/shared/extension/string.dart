extension StringExtension on String {
  String get removeZero {
    var response = this;

    if (toString().split(".").isNotEmpty) {
      var decmialPoint = toString().split(".")[1];
      if (decmialPoint == "0") {
        response = response.split(".0").join("");
      }
      if (decmialPoint == "00") {
        response = response.split(".00").join("");
      }
    }

    return response;
  }
}
