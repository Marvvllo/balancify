// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:balancify/constants/colors.dart';
import 'package:balancify/pages/transaction_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddTransactionPage extends StatefulWidget {
  const AddTransactionPage({super.key});

  @override
  State<AddTransactionPage> createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  final _formKey = GlobalKey<FormState>();

  final title = TextEditingController();
  final desc = TextEditingController();
  final dateTime = TextEditingController();
  final amount = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.dark,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
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
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text(
                "Add transactions",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 24.0,
                ),
              ),

              SizedBox(height: 16.0),

              // Title Field
              TextFormField(
                controller: title,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Title",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColor.primary, width: 2.0),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Title cannot be empty.";
                  }
                  return null;
                },
              ),

              SizedBox(height: 16.0),

              // Desc Field
              TextFormField(
                controller: desc,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Description",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColor.primary, width: 2.0),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Description cannot be empty.";
                  }
                  return null;
                },
              ),

              SizedBox(height: 16.0),

              // Amount Field
              TextFormField(
                controller: amount,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Amount",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColor.primary, width: 2.0),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Amount cannot be empty.";
                  }
                  return null;
                },
              ),

              SizedBox(height: 8.0),

              // Submit Button
              SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.resolveWith((states) {
                      return EdgeInsets.symmetric(vertical: 8.0);
                    }),
                    backgroundColor:
                        MaterialStateProperty.resolveWith((states) {
                      // If the button is pressed, return green, otherwise blue
                      if (states.contains(MaterialState.pressed)) {
                        return AppColor.primary;
                      }
                      return AppColor.darkPrimary;
                    }),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => TransactionDetailPage(
                                    title: title.text,
                                    desc: desc.text,
                                    amount: amount.text,
                                  )));
                    }
                  },
                  child: Text(
                    "Submit",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
