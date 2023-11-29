// ignore_for_file: prefer_const_constructors

import 'package:balancify/category_icon.dart';
import 'package:balancify/helper.dart';
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CategoryIcon(
                      category: transaction.category,
                      size: 36.0,
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          transaction.title,
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w700),
                        ),
                        Text(transaction.date),
                      ],
                    ),
                  ],
                ),
                Text(Helper.stringToIdr(transaction.amount, 2)),
              ],
            ),

            SizedBox(
              height: 8.0,
            ),

            Text(
              "Description",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
            ),
            Text(transaction.desc),
          ],
        ),
      ),
    );
  }
}
