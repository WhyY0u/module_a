import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:module_a/main.dart';
import 'package:module_a/model/user.dart';

class Profilerpage extends StatelessWidget {

   const Profilerpage({super.key});
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Профиль', style: TextStyle(fontSize: 17)),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[300],
      body: Padding(padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
            const SizedBox(height: 30),
            Center(child:
            Padding(padding: EdgeInsets.symmetric(vertical: 20), child: 
            Image.asset(
              'assets/avatar_placeholder_icon.png',  
              width: 80, 
              height: 80, 
              fit: BoxFit.cover,
            ),
        ),
      ),
         Text('Марипбек Чингиз', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),),
         const SizedBox(height: 10,),
         Text('maripbeoff@gmail.com', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300, color: Colors.grey[500]),),
         const SizedBox(height: 40),
          SizedBox(
              width: double.infinity,
              height: 60,
              child:
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.white, 
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              shape: const RoundedRectangleBorder(
                 borderRadius: BorderRadius.zero, 
            ),
            ),
            onPressed: () async {
  var userBox = await Hive.openBox<User>('userBox');
  User? user = userBox.get('userKey');
  
  if (user != null) {
    var authBox = await Hive.openBox('authBox');
    await authBox.put('isAuthenticated', false);  

    user.isAuthenticated = true;
    await userBox.put('userKey', user);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => AuthChecker()),
    );
  }
            },
            child: Row(mainAxisAlignment: MainAxisAlignment.start,
            children: [const Text(
              'Выход',
              style: TextStyle(
                color: Colors.red, 
                fontSize: 17,
                fontWeight: FontWeight.w400,
              ),
            ),
            ],)
          )
          )
        ]
      )
      )
    );
  }
}