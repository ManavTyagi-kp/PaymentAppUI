import 'package:flutter/material.dart';

class Stats extends StatelessWidget {
  String statType;
  double staTValue;
  String currency;
  bool blue;
  Stats({
    Key? key,
    required this.statType,
    required this.staTValue,
    required this.currency,
    required this.blue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          statType,
          style: const TextStyle(
            fontSize: 11,
            color: Color.fromARGB(221, 18, 18, 18),
          ),
        ),
        Row(
          children: [
            Text(
              staTValue.toStringAsFixed(2),
              style: TextStyle(
                fontSize: blue ? 22 : 24,
                fontWeight: FontWeight.w900,
                color: blue
                    ? const Color.fromARGB(255, 59, 106, 245)
                    : Colors.black87,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(currency),
          ],
        )
      ],
    );
  }
}

class StatCard extends StatelessWidget {
  const StatCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        height: 150,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 60,
                    width: 120,
                    child: Stats(
                        statType: 'Income',
                        staTValue: 20.00,
                        currency: 'USDT',
                        blue: true),
                  ),
                  SizedBox(
                    height: 60,
                    width: 120,
                    child: Stats(
                        statType: 'Withdraw',
                        staTValue: 0.00,
                        currency: 'USDT',
                        blue: true),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 60,
                    width: 135,
                    child: Stats(
                        statType: 'Expenses',
                        staTValue: 94.10,
                        currency: 'USDT',
                        blue: false),
                  ),
                  SizedBox(
                    height: 60,
                    width: 180,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 25,
                          width: 150,
                          child: ExpenseProgress(
                            color: 'blue',
                            type: 'Send',
                            percentage: 32,
                          ),
                        ),
                        SizedBox(
                          height: 25,
                          width: 150,
                          child: ExpenseProgress(
                            color: 'purple',
                            type: 'Payment',
                            percentage: 84,
                          ),
                        ),
                      ],
                    ),
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

class ExpenseProgress extends StatelessWidget {
  String color;
  String type;
  double percentage;
  ExpenseProgress({
    Key? key,
    required this.color,
    required this.type,
    required this.percentage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: 55,
          child: Text(
            type,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: color == 'blue' ? Colors.lightBlue : Colors.deepPurple,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(
          width: 30,
          height: 8,
          child: LinearProgressIndicator(
            borderRadius: BorderRadius.circular(40),
            value: percentage / 100,
            color: color == 'blue' ? Colors.lightBlue : Colors.deepPurple,
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          width: 35,
          child: Text(
            '${percentage.toInt()}%',
            textAlign: TextAlign.right,
            style: TextStyle(
              color: color == 'blue' ? Colors.lightBlue : Colors.deepPurple,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
