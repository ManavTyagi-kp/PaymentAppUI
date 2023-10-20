import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:payment_app_ui/models/transactions.dart';
import 'package:payment_app_ui/pages/myAppBar.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  double containerHeight = 800.0;
  double amount = 0;
  Users user = Transactions().user[0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CurrentBalance(
          white: true,
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.topRight,
                colors: <Color>[
                  Color.fromARGB(255, 17, 29, 230),
                  Color.fromARGB(255, 55, 161, 246)
                ]),
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: <Color>[
                Color.fromARGB(255, 17, 29, 230),
                Color.fromARGB(255, 55, 161, 246)
              ]),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: GestureDetector(
            onPanUpdate: (details) {
              setState(() {
                containerHeight -= details.delta.dy;
              });
            },
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ListView(
                children: [
                  Container(
                    height: containerHeight < 30 ? 30 : containerHeight,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(30)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
                      child: Column(
                        children: [
                          const Center(
                            child: Icon(
                              Icons.horizontal_rule_rounded,
                              size: 40,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 12.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.arrow_back_ios,
                                  color: Color.fromARGB(255, 6, 20, 88),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Send Money',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromARGB(255, 6, 20, 88),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              height: 250,
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 243, 242, 248),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Container(
                                      height: 100,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          boxShadow: const [
                                            BoxShadow(color: Colors.black),
                                          ]),
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10.0, 10, 10, 0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                const SizedBox(
                                                  height: 65,
                                                  child: Align(
                                                    alignment:
                                                        Alignment.topCenter,
                                                    child: CircleAvatar(
                                                      radius: 18,
                                                      backgroundImage: AssetImage(
                                                          'assets/profile/p4.jpg'),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 15,
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const Text(
                                                      "You're Sending",
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        color: Color.fromARGB(
                                                            255, 6, 20, 88),
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 0,
                                                    ),
                                                    SizedBox(
                                                      height: 40,
                                                      width: 100,
                                                      child: TextField(
                                                        inputFormatters: [
                                                          FilteringTextInputFormatter
                                                              .allow(RegExp(
                                                                  r'^\d+\.?\d{0,2}')),
                                                        ],
                                                        onChanged: (value) {
                                                          setState(() {
                                                            try {
                                                              if (value
                                                                  .isEmpty) {
                                                                amount = 0;
                                                              }
                                                              amount =
                                                                  double.parse(
                                                                      value);
                                                            } catch (e) {
                                                              print(e);
                                                            }
                                                          });
                                                        },
                                                        cursorHeight: 30,
                                                        decoration:
                                                            const InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none),
                                                        style: const TextStyle(
                                                          fontSize: 26,
                                                          fontWeight:
                                                              FontWeight.w900,
                                                          color: Color.fromARGB(
                                                              255,
                                                              59,
                                                              106,
                                                              245),
                                                        ),
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 50,
                                              child: Align(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: Text('USDT'),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        25.0, 10, 25, 0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      // crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                              height: 80,
                                              child: Align(
                                                alignment: Alignment.topCenter,
                                                child: CircleAvatar(
                                                  radius: 20,
                                                  backgroundImage:
                                                      AssetImage(user.image),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 15,
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      user.name,
                                                      style: const TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w900,
                                                        color: Color.fromARGB(
                                                            255, 6, 20, 88),
                                                      ),
                                                    ),
                                                    const Text(
                                                      ' will receive',
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Color.fromARGB(
                                                            255, 6, 20, 88),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  textBaseline:
                                                      TextBaseline.alphabetic,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .baseline,
                                                  children: [
                                                    const Text('\$ '),
                                                    Text(
                                                      (amount * 14.3121)
                                                          .toStringAsFixed(4),
                                                      style: const TextStyle(
                                                        fontSize: 26,
                                                        fontWeight:
                                                            FontWeight.w900,
                                                        color: Color.fromARGB(
                                                            255, 59, 106, 245),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  '${amount.toStringAsFixed(2)} USDT',
                                                  style: const TextStyle(
                                                      color: Colors.black54,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const Row(
                                          children: [
                                            Text('IDR'),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            CircleAvatar(
                                              radius: 8,
                                              backgroundImage: AssetImage(
                                                  'assets/brand logo/indonesia.png'),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Center(
                            child: Text(
                              '1 USDT = 14.3121.29I IDR',
                              style: TextStyle(
                                  color: Color.fromARGB(166, 0, 0, 0)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
