import 'dart:convert';

class Transaction {
  const Transaction({
    required this.title,
    required this.desc,
    required this.date,
    required this.time,
    required this.amount,
  });

  final String title, desc, date, time, amount;

  static Map<String, dynamic> toMap(Transaction transaction) => {
        'title': transaction.title,
        'desc': transaction.desc,
        'date': transaction.date,
        'time': transaction.time,
        'amount': transaction.amount,
      };

  static String encode(List<Transaction> transactions) => jsonEncode(
        transactions
            .map<Map<String, dynamic>>(
                (transaction) => Transaction.toMap(transaction))
            .toList(),
      );
}
