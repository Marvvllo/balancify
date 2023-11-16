// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:balancify/constants/colors.dart';
import 'package:balancify/helper.dart';
import 'package:balancify/pages/transaction_detail.dart';
import 'package:balancify/transaction.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  getSharedPrefs() async {
    prefs = await SharedPreferences.getInstance();
    getTransactions();
  }

  getTransactions() {
    List<String>? transactionListString = prefs.getStringList('transactions');
    if (transactionListString != null) {
      transactions = transactionListString
          .map((transaction) => Transaction.fromJson(jsonDecode(transaction)))
          .toList();
    }

    setState(() {});
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
                  color: AppColor.lightGrey,
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
                            Icons.dining_outlined,
                            size: 30.0,
                            color: Colors.green,
                          ),
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Food',
                      ),
                      Text('Rp250.000'),
                    ],
                  ),
                ),
              ),

              SizedBox(width: 16.0),

              // Travel Total
              Container(
                decoration: BoxDecoration(
                  color: AppColor.lightGrey,
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
                      Text('Rp800.000'),
                    ],
                  ),
                ),
              ),

              SizedBox(width: 16.0),

              // Travel Total
              Container(
                decoration: BoxDecoration(
                  color: AppColor.lightGrey,
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
                            Icons.shopping_cart_outlined,
                            size: 30.0,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Travel',
                      ),
                      Text('Rp800.000'),
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
            child: ListView.separated(
              itemCount: transactions.length,
              separatorBuilder: (context, index) => SizedBox(height: 8.0),
              itemBuilder: ((context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TransactionDetailPage(
                              transaction: transactions[index]),
                        ));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xff1e1e1e),
                        borderRadius: BorderRadius.circular(16.0)),
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.blue[200]?.withOpacity(0.2),
                            borderRadius:
                                BorderRadius.all(Radius.circular(1000)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Icon(
                              Icons.shopping_cart_outlined,
                              size: 30.0,
                              color: Colors.blue,
                            ),
                          ),
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
                                  ),
                                  Text(transactions[index].date),
                                ],
                              ),

                              // Amount
                              Text(
                                Helper.stringToIdr(
                                    transactions[index].amount, 0),
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
        )
      ],
    );
  }
}
