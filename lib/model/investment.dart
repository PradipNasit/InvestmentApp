class Investment {
  String name;
  double amountInvested;
  double currentValue;

  Investment({required this.name, required this.amountInvested, required this.currentValue});

  double get percentageGrowth => ((currentValue - amountInvested) / amountInvested) * 100;

  Map<String, dynamic> toJson() => {
    'name': name,
    'amountInvested': amountInvested,
    'currentValue': currentValue,
  };

  factory Investment.fromJson(Map<String, dynamic> json) {
    return Investment(
      name: json['name'],
      amountInvested: json['amountInvested'],
      currentValue: json['currentValue'],
    );
  }
}
