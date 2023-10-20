import 'package:flutter/material.dart';
import 'package:payment_app_ui/pages/myAppBar.dart';
import 'package:payment_app_ui/pages/sendPayment.dart';
import 'package:payment_app_ui/pages/transactionPage.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // print(fullList);
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        // backgroundColor: Colors.white,
        onDestinationSelected: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        indicatorColor: Colors.transparent,
        selectedIndex: currentIndex,
        destinations: [
          NavigationDestination(
            icon: Padding(
              padding: const EdgeInsets.fromLTRB(40.0, 0, 0, 0),
              child: Icon(
                Icons.home_filled,
                color: currentIndex == 0
                    ? const Color.fromARGB(255, 42, 96, 255)
                    : Colors.black54,
                size: 38,
              ),
            ),
            label: '',
          ),
          NavigationDestination(
            icon: Container(
              width: 85,
              height: 60,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.elliptical(100, 100)),
                color: Color.fromARGB(255, 13, 25, 234),
                shape: BoxShape.rectangle,
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(6, 0, 0, 8.0),
                child: Transform.rotate(
                  angle: 5.7,
                  child: const Icon(
                    Icons.send,
                    color: Colors.white,
                    size: 35,
                  ),
                ),
              ),
            ),
            label: '',
          ),
          NavigationDestination(
            icon: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 40.0, 0),
              child: Icon(
                Icons.receipt_long_outlined,
                color: currentIndex == 2
                    ? const Color.fromARGB(255, 42, 96, 255)
                    : Colors.black54,
                size: 35,
              ),
            ),
            label: '',
          ),
        ],
      ),
      // backgroundColor: const Color.fromARGB(255, 243, 242, 248),
      body: [
        const MyAppBar(),
        const PaymentPage(),
        const TransactionsPage(),
      ][currentIndex],
    );
  }
}
