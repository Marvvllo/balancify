// ignore_for_file: prefer_const_constructors

import 'package:balancify/category_icon.dart';
import 'package:balancify/transaction.dart';
import 'package:flutter/material.dart';
import 'package:balancify/constants/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TransactionDetailPage extends StatelessWidget {
  const TransactionDetailPage({
    super.key,
    required this.transaction,
  });

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.dark,
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: SvgPicture.asset(
            'assets/logo.svg',
            semanticsLabel: 'Balancify Logo',
            height: 24,
          ),
        ),
        backgroundColor: AppColor.dark,
        elevation: 0,
      ),
      body: Column(
        children: [
          Text(transaction.title),
          Text(transaction.desc),
          Text(transaction.date),
          Text(transaction.category),
          CategoryIcon(category: transaction.category),
          Text(transaction.amount),
        ],
      ),
    );
  }
}
