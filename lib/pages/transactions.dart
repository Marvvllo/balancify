// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:balancify/constants/colors.dart';
import 'package:balancify/helper.dart';
import 'package:balancify/pages/transaction_detail.dart';
import 'package:balancify/transaction.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../category_icon.dart';

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({
    super.key,
  });

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  late SharedPreferences prefs;
  List<Transaction> transactions = List.empty(growable: true);
  int totalFood = 0;
  int totalTravel = 0;
  int totalShopping = 0;

  getSharedPrefs() async {
    prefs = await SharedPreferences.getInstance();
    getTransactions();
    // print(transactions[0].amount);
  }

  Future<void> getTransactions() async {
    List<String>? transactionListString = prefs.getStringList('transactions');
    if (transactionListString != null) {
      transactions = transactionListString
          .map((transaction) => Transaction.fromJson(jsonDecode(transaction)))
          .toList();
    }

    transactions.sort((b, a) => a.date.compareTo(b.date));

    setState(() {
      totalFood = 0;
      totalTravel = 0;
      totalShopping = 0;
      for (var transaction in transactions) {
        switch (transaction.category) {
          case 'Food':
            totalFood += int.parse(transaction.amount);
            break;
          case 'Travel':
            totalTravel += int.parse(transaction.amount);
            break;
          case 'Shopping':
            totalShopping += int.parse(transaction.amount);
            break;
          default:
            break;
        }
      }
    });
  }

  Future<void> removeTransaction(String id) async {
    final prefs = await SharedPreferences.getInstance();
    List<Transaction> transactions = List.empty(growable: true);

    List<String>? transactionListString = prefs.getStringList('transactions');
    if (transactionListString != null) {
      transactions = transactionListString
          .map((transaction) => Transaction.fromJson(jsonDecode(transaction)))
          .toList();
    }

    transactions.removeWhere((transaction) => transaction.id == id);
    transactionListString = transactions
        .map((transaction) => jsonEncode(transaction.toJson()))
        .toList();
    prefs.setStringList('transactions', transactionListString);
  }

  @override
  void initState() {
    getSharedPrefs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(width: 16.0),

              // Food Total
              Container(
                decoration: BoxDecoration(
                  color: AppColor.darkGrey,
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 32.0, vertical: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.green[200]?.withOpacity(0.2),
                          borderRadius: BorderRadius.all(Radius.circular(1000)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Icon(
                            Icons.fastfood_sharp,
                            size: 30.0,
                            color: Colors.green,
                          ),
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Food',
                      ),
                      Text(Helper.stringToIdr(totalFood.toString(), 0)),
                    ],
                  ),
                ),
              ),

              SizedBox(width: 16.0),

              // Travel Total
              Container(
                decoration: BoxDecoration(
                  color: AppColor.darkGrey,
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 32.0, vertical: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.orange[200]?.withOpacity(0.2),
                          borderRadius: BorderRadius.all(Radius.circular(1000)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Icon(
                            Icons.flight,
                            size: 30.0,
                            color: Colors.orange,
                          ),
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Travel',
                      ),
                      Text(Helper.stringToIdr(totalTravel.toString(), 0)),
                    ],
                  ),
                ),
              ),

              SizedBox(width: 16.0),

              // Shopping Total
              Container(
                decoration: BoxDecoration(
                  color: AppColor.darkGrey,
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 32.0, vertical: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blue[200]?.withOpacity(0.2),
                          borderRadius: BorderRadius.all(Radius.circular(1000)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Icon(
                            Icons.shopping_bag,
                            size: 30.0,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Shopping',
                      ),
                      Text(Helper.stringToIdr(totalShopping.toString(), 0)),
                    ],
                  ),
                ),
              ),

              SizedBox(width: 16.0),
            ],
          ),
        ),

        // List Transaksi
        Flexible(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: RefreshIndicator(
              onRefresh: getTransactions,
              child: ListView.builder(
                physics: AlwaysScrollableScrollPhysics(),
                itemCount: transactions.length,
                // separatorBuilder: (context, index) => SizedBox(height: 16.0),
                itemBuilder: ((context, index) {
                  return InkWell(
                    onLongPress: () {
                      removeTransaction(transactions[index].id);
                    },
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TransactionDetailPage(
                              transaction: transactions[index],
                            ),
                          ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [
                          CategoryIcon(
                            category: transactions[index].category,
                          ),

                          SizedBox(width: 16.0),

                          // Texts
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Title and Date
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      transactions[index].title,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(transactions[index].date),
                                  ],
                                ),

                                // Amount
                                Row(
                                  children: [
                                    Text(
                                      Helper.stringToCompactIdr(
                                          transactions[index].amount),
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_right,
                                      color: Colors.grey[400],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
