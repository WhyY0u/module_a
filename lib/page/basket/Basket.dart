import 'package:flutter/material.dart';

class BasketPage extends StatefulWidget {
  const BasketPage({super.key});

  @override
  _BasketPageState createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Корзина'),
      centerTitle: true,
    ),
    backgroundColor: Colors.grey[300],
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, 
        crossAxisAlignment: CrossAxisAlignment.center, 
        children: <Widget>[
          Text(
            'В вашей корзине\nпока пусто',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 5), 
          Text(
            'Добавьте товары из каталога',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  );
}
}
