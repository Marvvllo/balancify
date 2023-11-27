// ignore_for_file: prefer_const_constructors

import 'package:balancify/pages/add_transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'constants/colors.dart';
import 'pages/transactions.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'Jost',
          textTheme: TextTheme(bodyMedium: TextStyle(fontSize: 16.0)),
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppColor.primary,
            brightness: Brightness.dark,
          )),
      color: AppColor.dark,
      home: AppNavigation(),
    );
  }
}

class AppNavigation extends StatefulWidget {
  const AppNavigation({
    super.key,
  });

  @override
  State<AppNavigation> createState() => AppNavigationState();
}

class AppNavigationState extends State<AppNavigation>
    with TickerProviderStateMixin {
  late TabController _bottomTabController;

  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
  static const List<Tab> _navigationTabs = [
    Tab(icon: Icon(Icons.home)),
    Tab(icon: Icon(Icons.receipt_long)),
  ];

  @override
  void initState() {
    super.initState();
    _bottomTabController =
        TabController(vsync: this, length: _navigationTabs.length);
  }

  @override
  void dispose() {
    _bottomTabController.dispose();
    super.dispose();
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
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddTransactionPage(),
                ),
              );
            },
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
          )
        ],
        backgroundColor: AppColor.dark,
        elevation: 0,
      ),
      body: TabBarView(
        controller: _bottomTabController,
        children: const [
          Icon(Icons.directions_transit),
          TransactionsPage(),
        ],
      ),
      bottomNavigationBar: Material(
        color: AppColor.dark,
        child: TabBar(
          controller: _bottomTabController,
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(
              color: AppColor.primary,
              width: 3.0,
            ),
          ),
          indicatorColor: AppColor.primary,
          indicatorSize: TabBarIndicatorSize.tab,
          labelColor: AppColor.primary,
          unselectedLabelColor: Colors.grey,
          tabs: _navigationTabs,
        ),
      ),
    );
  }
}
