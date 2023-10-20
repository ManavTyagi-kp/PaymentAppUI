import 'package:flutter/material.dart';
import 'package:payment_app_ui/main.dart';
import 'package:payment_app_ui/pages/homePage.dart';
import 'package:provider/provider.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: AppBar(
            backgroundColor: const Color.fromARGB(255, 243, 242, 248),
            elevation: 0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Hi, Octavia',
                      style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 67, 72, 106)),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CurrentBalance(
                      white: false,
                    ),
                  ],
                ),
                Row(
                  children: [
                    ChangeThemeButtonWidget(),
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
        ),
      ),
      body: const MyHomePage(),
    );
  }
}

class CurrentBalance extends StatelessWidget {
  bool white;
  CurrentBalance({
    Key? key,
    required this.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 15,
          backgroundColor: Colors.transparent,
          // backgroundImage: AssetImage('assets/logo/logoSmall.png'),
          child: Icon(
            Icons.telegram_outlined,
            size: 30,
            color: white ? Colors.white : Colors.black,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          '240.10',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: white ? Colors.white : const Color.fromARGB(255, 6, 20, 88),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(6, 4, 6, 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: white ? Color.fromARGB(87, 255, 255, 255) : Colors.white,
          ),
          child: Text(
            'USDT',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color:
                  white ? Colors.white : const Color.fromARGB(151, 6, 20, 88),
            ),
          ),
        ),
      ],
    );
  }
}

class ChangeThemeButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //----First we want to get the theme provider----
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Switch.adaptive(
      //---isDarkMode to return if its dark or not--true or false--
      value: themeProvider.isDarkMode,
      onChanged: (value) {
        final provider = Provider.of<ThemeProvider>(context, listen: false);
        provider.toggleTheme(value);
      },
      activeColor: themeProvider.isDarkMode ? Colors.purple : Colors.green,
    );
  }
}
