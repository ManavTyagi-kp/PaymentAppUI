import 'package:flutter/material.dart';

import 'package:payment_app_ui/models/transactions.dart';

class PaymentCard extends StatelessWidget {
  Users user;
  bool type;
  PaymentCard({
    Key? key,
    required this.user,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: Color.fromARGB(255, 255, 255, 255),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 22,
                    backgroundImage: AssetImage(user.image),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.name,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      !type
                          ? Text(
                              user.time,
                            )
                          : Container(
                              padding: const EdgeInsets.fromLTRB(10, 1, 10, 1),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: user.transaction < 0
                                    ? const Color.fromARGB(255, 231, 248, 255)
                                    : const Color.fromARGB(213, 229, 182, 179),
                              ),
                              child: Text(
                                user.transaction < 0 ? 'Send' : 'Receive',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: user.transaction < 0
                                        ? const Color.fromARGB(
                                            255, 49, 193, 245)
                                        : Colors.red),
                              ),
                            ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Text(
                        user.transaction.toString(),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Text(
                        user.currency,
                        style: const TextStyle(
                          fontSize: 10,
                          color: Color.fromARGB(255, 72, 71, 71),
                        ),
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.keyboard_arrow_right,
                    size: 30,
                    color: Color.fromARGB(156, 0, 0, 0),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
