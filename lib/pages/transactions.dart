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
      ],
    );
  }
}
