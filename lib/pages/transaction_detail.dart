// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:balancify/constants/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TransactionDetailPage extends StatelessWidget {
  const TransactionDetailPage({
    super.key,
    required this.title,
    required this.desc,
    required this.amount,
  });

  final String title, desc, amount;

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
          Text(title),
          Text(desc),
          Text(amount),
        ],
      ),
    );
  }
}
