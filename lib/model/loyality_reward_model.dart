class LoyalityRewardModel {
  final int? id;
  final String? image;
  final String? date;
  final String? transactionReward;
  final String? transactionRs;

  LoyalityRewardModel({
    this.id,
    this.image,
    this.date,
    this.transactionReward,
    this.transactionRs,
  });

  factory LoyalityRewardModel.fromJson(Map<String, dynamic> json) => LoyalityRewardModel(
    id: json["id"],
    image: json["image"],
    date: json["date"],
    transactionReward: json["transaction_reward"],
    transactionRs: json["transaction_rs"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "date": date,
    "transaction_reward": transactionReward,
    "transaction_rs": transactionRs,
  };
}
