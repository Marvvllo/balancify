class Transaction {
  const Transaction({
    required this.title,
    required this.desc,
    required this.date,
    required this.time,
    required this.amount,
  });

  final String title, desc, date, time, amount;

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        title: json['title'],
        desc: json['desc'],
        date: json['date'],
        time: json['time'],
        amount: json['amount'],
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'desc': desc,
        'date': date,
        'time': time,
        'amount': amount,
      };
}
