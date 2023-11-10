// ignore_for_file: prefer_const_constructors

import 'package:balancify/constants/colors.dart';
import 'package:flutter/material.dart';

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
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
                    children: const [
                      Icon(Icons.food_bank_outlined, size: 50.0),
                      SizedBox(height: 8.0),
                      Text('Food'),
                      SizedBox(height: 8.0),
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
                    children: const [
                      Icon(Icons.card_travel, size: 45.0),
                      SizedBox(height: 8.0),
                      Text('Travel'),
                      SizedBox(height: 8.0),
                      Text('Rp250.000'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
