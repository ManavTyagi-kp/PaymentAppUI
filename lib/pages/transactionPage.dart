// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:payment_app_ui/TextStyles/heading1.dart';
import 'package:payment_app_ui/cards/paymentCard.dart';
import 'package:payment_app_ui/cards/statCard.dart';
import 'package:payment_app_ui/models/transactions.dart';
import 'package:payment_app_ui/pages/myAppBar.dart';

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({super.key});

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  late Users user;
  int _currentIndex = 0;
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = const [
      DropdownMenuItem(value: "Daily", child: Text("Daily")),
      DropdownMenuItem(value: "Weekly", child: Text("Weekly")),
      DropdownMenuItem(value: "Monthly", child: Text("Monthly")),
      DropdownMenuItem(value: "Yearly", child: Text("Yearly")),
    ];
    return menuItems;
  }

  List<Users> lst = Transactions().all;

  String selectedValue = "Weekly";

  @override
  Widget build(BuildContext context) {
    List<Users> getTodayTransactions() {
      return lst.where((user) {
        return user.filter == 'Today';
      }).toList();
    }

    List<Users> getYesterdayTransactions() {
      return lst.where((user) {
        return user.filter == 'Yesterday';
      }).toList();
    }

    List<Users> getEarlierTransactions() {
      return lst.where((user) {
        return user.filter == 'Earlier';
      }).toList();
    }

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: const Color.fromARGB(255, 243, 242, 248),
        // backgroundColor: const Color.fromARGB(255, 233, 241, 243),
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 6.0),
              child: Heading1(str: 'Transaction'),
            ),
            Row(
              children: [
                IconButton(
                  color: const Color.fromARGB(255, 84, 91, 132),
                  onPressed: () {},
                  icon: const Icon(Icons.notifications),
                  iconSize: 35,
                ),
                const CircleAvatar(
                  radius: 14,
                  backgroundImage: AssetImage('assets/profile/p4.jpg'),
                ),
              ],
            )
          ],
        ),
      ),
      // backgroundColor: const Color.fromARGB(255, 243, 242, 248),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 20, 20, 0),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CurrentBalance(
                  white: false,
                ),
                Container(
                  height: 34,
                  width: 92,
                  padding: const EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: DropdownButton(
                        underline: const Icon(null),
                        value: selectedValue,
                        borderRadius: BorderRadius.zero,
                        alignment: Alignment.bottomCenter,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                        icon: const Icon(Icons.keyboard_arrow_down_outlined),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedValue = newValue!;
                          });
                        },
                        items: dropdownItems),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 150,
              width: MediaQuery.of(context).size.width - 16,
              child: const StatCard(),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentIndex = 0;
                      lst = Transactions().all;
                    });
                  },
                  child: Text(
                    'All',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: _currentIndex == 0
                          ? FontWeight.w600
                          : FontWeight.w400,
                      color: _currentIndex == 0
                          ? const Color.fromARGB(255, 59, 106, 245)
                          : Colors.grey,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentIndex = 1;
                      lst = Transactions().all;
                      lst = lst.where((user) {
                        return user.transaction < 0;
                      }).toList();
                    });
                  },
                  child: Text(
                    'Send',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: _currentIndex == 1
                          ? FontWeight.w600
                          : FontWeight.w400,
                      color: _currentIndex == 1
                          ? const Color.fromARGB(255, 59, 106, 245)
                          : Colors.grey,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentIndex = 2;
                      lst = Transactions().all;
                      lst = lst.where((user) {
                        return user.transaction > 0;
                      }).toList();
                    });
                  },
                  child: Text(
                    'Received',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: _currentIndex == 2
                          ? FontWeight.w600
                          : FontWeight.w400,
                      color: _currentIndex == 2
                          ? const Color.fromARGB(255, 59, 106, 245)
                          : Colors.grey,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentIndex = 3;
                      lst = Transactions().payments;
                    });
                  },
                  child: Text(
                    'Payment',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: _currentIndex == 3
                          ? FontWeight.w600
                          : FontWeight.w400,
                      color: _currentIndex == 3
                          ? const Color.fromARGB(255, 59, 106, 245)
                          : Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Heading1(str: 'Today'),
            const SizedBox(
              height: 10,
            ),
            for (user in getTodayTransactions())
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
                child: SizedBox(
                  height: 92,
                  child: PaymentCard(
                    user: user,
                    type: true,
                  ),
                ),
              ),
            const SizedBox(
              height: 20,
            ),
            Heading1(str: 'Yesterday'),
            const SizedBox(
              height: 10,
            ),
            for (user in getYesterdayTransactions())
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
                child: SizedBox(
                  height: 92,
                  child: PaymentCard(
                    user: user,
                    type: true,
                  ),
                ),
              ),
            const SizedBox(
              height: 20,
            ),
            Heading1(str: 'Earlier'),
            const SizedBox(
              height: 10,
            ),
            for (user in getEarlierTransactions())
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
                child: SizedBox(
                  height: 92,
                  child: PaymentCard(
                    user: user,
                    type: true,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
