class Transaction {
  Transaction({
    required this.id,
    required this.title,
    required this.desc,
    required this.date,
    required this.category,
    required this.amount,
  });

  final String id, title, desc, date, category, amount;

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        id: json['id'],
        title: json['title'],
        desc: json['desc'],
        date: json['date'],
        category: json['category'],
        amount: json['amount'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'desc': desc,
        'date': date,
        'category': category,
        'amount': amount,
      };
}
