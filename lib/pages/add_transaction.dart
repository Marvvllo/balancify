// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:balancify/constants/colors.dart';
import 'package:balancify/transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddTransactionPage extends StatefulWidget {
  const AddTransactionPage({super.key});

  @override
  State<AddTransactionPage> createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  final _formKey = GlobalKey<FormState>();

  final title = TextEditingController();
  final desc = TextEditingController();
  final date = TextEditingController();
  final timeController = TextEditingController();
  final amount = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2000),
        lastDate: DateTime(2101));
    if (picked != null) {
      setState(() {
        DateTime selectedDate = picked;
        date.text = DateFormat.yMd().format(selectedDate);
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        TimeOfDay selectedTime = picked;
        String time =
            '${selectedTime.hour.toString().padLeft(2, '0')}:${selectedTime.minute.toString().padLeft(2, '0')}';
        timeController.text = time;
      });
    }
  }

  // Shared Prefs

  Future<void> addTransaction(Transaction newTransaction) async {
    final prefs = await SharedPreferences.getInstance();
    List<Transaction> transactions = List.empty(growable: true);

    List<String>? transactionListString = prefs.getStringList('transactions');
    if (transactionListString != null) {
      transactions = transactionListString
          .map((transaction) => Transaction.fromJson(jsonDecode(transaction)))
          .toList();
    }

    transactions.add(newTransaction);
    transactionListString = transactions
        .map((transaction) => jsonEncode(transaction.toJson()))
        .toList();
    prefs.setStringList('transactions', transactionListString);
  }

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
          child: SingleChildScrollView(
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
                      borderSide:
                          BorderSide(color: AppColor.primary, width: 2.0),
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
                      borderSide:
                          BorderSide(color: AppColor.primary, width: 2.0),
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

                // Date Picker
                InkWell(
                  onTap: () {
                    _selectDate(context);
                  },
                  child: TextFormField(
                    style: TextStyle(fontSize: 24),
                    textAlign: TextAlign.center,
                    enabled: false,
                    keyboardType: TextInputType.text,
                    controller: date,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Date cannot be empty.";
                      }
                      return null;
                    },
                    onTap: () {
                      _selectDate(context);
                    },
                    onSaved: (String? val) {
                      date.text = val as String;
                    },
                    decoration: InputDecoration(
                      labelText: "Date",
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColor.primary, width: 2.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),

                // Time Picker
                InkWell(
                  onTap: () {
                    _selectTime(context);
                  },
                  child: TextFormField(
                    style: TextStyle(fontSize: 24),
                    textAlign: TextAlign.center,
                    // readOnly: true,
                    enabled: false,
                    keyboardType: TextInputType.text,
                    controller: timeController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Time cannot be empty.";
                      }
                      return null;
                    },
                    onTap: () {
                      _selectDate(context);
                    },
                    onSaved: (String? val) {
                      date.text = val as String;
                    },
                    decoration: InputDecoration(
                      labelText: "Time",
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColor.primary, width: 2.0),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 16.0),

                // Amount Field
                TextFormField(
                  controller: amount,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Amount",
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColor.primary, width: 2.0),
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
                        addTransaction(
                          Transaction(
                            title: title.text,
                            desc: desc.text,
                            date: date.text,
                            time: timeController.text,
                            amount: amount.text,
                          ),
                        );
                        Navigator.pop(context);
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
      ),
    );
  }
}
