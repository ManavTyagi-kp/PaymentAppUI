// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:payment_app_ui/main.dart';

import 'package:payment_app_ui/models/transactions.dart';

class TransactionCard extends StatefulWidget {
  Users user;
  TransactionCard({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<TransactionCard> createState() => _TransactionCardState();
}

class _TransactionCardState extends State<TransactionCard> {
  @override
  Widget build(BuildContext context) {
    bool active = widget.user.transaction < 0;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        color: active ? const Color.fromARGB(255, 59, 106, 245) : Colors.white,
        // color: active ? MyThemes().darkTheme : Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(widget.user.image),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: widget.user.transaction < 0
                        ? Color.fromARGB(255, 204, 204, 204)
                        : Colors.black54,
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  widget.user.transaction < 0
                      ? Text(
                          'You send to ',
                          style: TextStyle(
                            fontSize: 18,
                            color: active ? Colors.white : Colors.black,
                          ),
                        )
                      : const Text(''),
                  Text(
                    widget.user.name,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                        color: active ? Colors.white : Colors.black),
                  ),
                  widget.user.transaction > 0
                      ? Text(
                          ' sent you',
                          style: TextStyle(
                            fontSize: 18,
                            color: active ? Colors.white : Colors.black,
                          ),
                        )
                      : const Text(''),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Text(
                    widget.user.transaction < 0
                        ? (widget.user.transaction * -1).toStringAsFixed(2)
                        : widget.user.transaction.toStringAsFixed(2),
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w900,
                        color: active
                            ? Colors.white
                            : const Color.fromARGB(255, 59, 106, 245)),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    widget.user.currency,
                    style:
                        TextStyle(color: active ? Colors.white : Colors.black),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                child: Text(
                  widget.user.message,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 13,
                    color: active
                        ? const Color.fromARGB(235, 255, 255, 255)
                        : const Color.fromARGB(189, 0, 0, 0),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    widget.user.time,
                    style: TextStyle(
                      color: active
                          ? const Color.fromARGB(235, 255, 255, 255)
                          : const Color.fromARGB(189, 0, 0, 0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
