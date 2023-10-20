// ignore_for_file: public_member_api_docs, sort_constructors_first
class Transactions {
  List<Users> user = [u1, u2, u3, u4, u5, u6, u7, u8, u9];
  List<Users> payments = [p1, p2, p3, p4, p5, p6];
  List<Users> all = [];

  Transactions() {
    all = user + payments;
  }
}

Users u1 = Users(
  name: 'Kinan',
  image: 'assets/profile/p9.jpg',
  transaction: -42.00,
  currency: 'USDT',
  message: 'Thanks for yesterday my bestie ❤️',
  time: '2 minutes ago',
  filter: 'Today',
);
Users u2 = Users(
  name: 'Agus',
  image: 'assets/profile/p7.jpg',
  transaction: 20.00,
  currency: 'USDT',
  message: 'Your cake is so delicious sometime i will buy again',
  time: 'Yesterday',
  filter: 'Yesterday',
);
Users u3 = Users(
  name: 'Grey',
  image: 'assets/profile/p2.jpg',
  transaction: -65.00,
  currency: 'USDT',
  message:
      "Happy birthday, Christie! Sending you \$50 for a fantastic day ahead. 🎉🎂",
  time: '2 days ago',
  filter: 'Earlier',
);
Users u4 = Users(
  name: 'Yanti',
  image: 'assets/profile/p3.jpg',
  transaction: -43.00,
  currency: 'IDR',
  message:
      "Thanks for the delicious dinner, Here's \$40 to cover my share. 😊🍔",
  time: '2 days ago',
  filter: 'Earlier',
);
Users u5 = Users(
  name: 'Nolan',
  image: 'assets/profile/p5.jpg',
  transaction: 356.00,
  currency: 'USDT',
  message:
      "For the awesome teamwork, Transferring \$500 for our successful project. 🚀",
  time: '2 days ago',
  filter: 'Earlier',
);
Users u6 = Users(
    name: 'Niket',
    image: 'assets/profile/p1.jpg',
    transaction: 562.00,
    currency: 'USDT',
    message:
        'For the great time we had last weekend! Here\'s \$562 as a token of our friendship. 🚀🎉',
    time: '4 days ago',
    filter: 'Earlier');
Users u7 = Users(
    name: 'Billie',
    image: 'assets/profile/p6.jpg',
    transaction: -928.00,
    currency: 'CAND',
    message:
        'Your support means the world to me. Sending you \$928 with immense gratitude. 🙏',
    time: '1 week ago',
    filter: 'Earlier');
Users u8 = Users(
    name: 'Elon',
    image: 'assets/profile/p8.jpg',
    transaction: 32.00,
    currency: 'USDT',
    message:
        'Small contribution to our next big adventure! \$32 coming your way. 🚀',
    time: '1 week ago',
    filter: 'Earlier');
Users u9 = Users(
    name: 'Ambi',
    image: 'assets/profile/p0.jpg',
    transaction: -4000.00,
    currency: 'INR',
    message:
        'Happy to help out. Here\'s \$4000 for whatever you need. Take care! 🤗',
    time: '1 week ago',
    filter: 'Earlier');

Users p1 = Users(
  name: 'Amazon',
  image: 'assets/brand logo/amazon.png',
  transaction: 95.00,
  currency: 'USDT',
  message: '',
  time: '1 minute ago',
  filter: 'Today',
);
Users p2 = Users(
  name: 'Apple',
  image: 'assets/brand logo/apple-logo.png',
  transaction: -18.10,
  currency: 'USDT',
  message: '',
  time: 'Today, 10:21 am',
  filter: 'Today',
);
Users p3 = Users(
  name: 'Google',
  image: 'assets/brand logo/google-logo.png',
  transaction: -5.00,
  currency: 'USDT',
  message: '',
  time: 'Yesterday',
  filter: 'Yesterday',
);
Users p4 = Users(
    name: "McDonald",
    image: 'assets/brand logo/mcdonalds-logo.png',
    transaction: -20.15,
    currency: 'USDT',
    message: '',
    time: 'Yesterday',
    filter: 'Yesterday');
Users p5 = Users(
    name: 'Microsoft',
    image: 'assets/brand logo/microsoft-logo.png',
    transaction: -138.60,
    currency: 'USDT',
    message: '',
    time: '2 days ago',
    filter: 'Earlier');
Users p6 = Users(
    name: 'Nike',
    image: 'assets/brand logo/nike.png',
    transaction: -56.18,
    currency: 'USDT',
    message: '',
    time: '1 week ago',
    filter: 'Earlier');

class Users {
  String name;
  String image;
  double transaction;
  String currency;
  String message;
  String time;
  String filter;
  Users({
    required this.name,
    required this.image,
    required this.transaction,
    required this.currency,
    required this.message,
    required this.time,
    required this.filter,
  });
}
