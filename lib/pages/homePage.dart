import 'package:flutter/material.dart';
import 'package:payment_app_ui/TextStyles/heading1.dart';
import 'package:payment_app_ui/cards/paymentCard.dart';
import 'package:payment_app_ui/cards/transactionCard.dart';
import 'package:payment_app_ui/models/transactions.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 243, 242, 248),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
        child: ListView(
          children: [
            SizedBox(
              height: 280,
              child: ListView.builder(
                itemCount: 9,
                controller: ScrollController(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, i) {
                  for (int index = 0; index < 10;) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 15, 5, 5),
                      child: Transform.scale(
                        scale: 1,
                        child: SizedBox(
                          width: 220,
                          child: TransactionCard(
                            user: Transactions().user[i],
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 8, 0, 8),
                child: Heading1(str: 'Send Again'),
              ),
            ),
            SizedBox(
              height: 130,
              child: ListView.builder(
                  itemCount: 9,
                  controller: ScrollController(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, i) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                AssetImage(Transactions().user[i].image),
                          ),
                        ),
                        Text(
                          Transactions().user[i].name,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: Colors.black87),
                        ),
                      ],
                    );
                  }),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Heading1(str: 'Recent Payments'),
                  ),
                  const Text(
                    'All Transaction',
                    style: TextStyle(
                        color: Color.fromARGB(255, 17, 71, 235),
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            for (int i = 0; i < 6; i++)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 100,
                  child: PaymentCard(
                    user: Transactions().payments[i],
                    type: false,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
