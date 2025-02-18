
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:module_a/model/user.dart';
import 'package:module_a/navigator/Navigator.dart';
import 'package:module_a/page/register/RegistrationPage.dart';

class LoginPage extends StatelessWidget {

 final TextEditingController _emailController = TextEditingController();
 final TextEditingController _passwordController = TextEditingController();

 LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Авторизация'),
        centerTitle: true,

      ),
      backgroundColor: Colors.grey[300],
      body: Padding(padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: 'Почта',
              contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              labelStyle: TextStyle(color: Colors.grey[400]),
              fillColor: Colors.white,
              filled: true,
              border: InputBorder.none,
              focusedBorder:UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[200]!),
               ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[200]!),
               ),
            ),
          ),
          const SizedBox(height: 0),
          TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Пароль',
                labelStyle: TextStyle(color: Colors.grey[400]),
                fillColor: Colors.white,
                filled: true,
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity, 
              child: Padding(padding: const EdgeInsets.symmetric(horizontal: 10),
              child:  ElevatedButton(
                onPressed: () async {
                  bool isValidEmail = RegExp(
                    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA9]{2,}$'
                  ).hasMatch(_emailController.text);

                  if (isValidEmail) {
                    var userBox = await Hive.openBox<User>('userBox');

                    User? user = userBox.values.firstWhere(
                      (user) => user.email == _emailController.text && user.password == _passwordController.text,
                      orElse: () => User(login: '', password: '', email: '', isAuthenticated: false), 
                    );
                  
                    if (user != null && user.login != '') {
                      var authBox = await Hive.openBox('authBox');
                      await authBox.put('isAuthenticated', true);  

                      user.isAuthenticated = true;
                      await userBox.put('userKey', user);

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => MainScreen()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Неверный логин или пароль!')),
                      );
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Некорректный адрес электронной почты!')),
                    );
                  }
                },

                child: Text('Войти'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  textStyle: TextStyle(fontSize: 17),
                  backgroundColor: const Color.fromARGB(255, 90, 35, 241),
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              ),
            ),
            const SizedBox(height: 25),
             SizedBox(
              width: double.infinity, 
              child: Padding(padding: const EdgeInsets.symmetric(horizontal: 10),
              child:  ElevatedButton(
                onPressed: () {
                   Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => RegistrationPage()),
            );
                },
                child: Text('Зарегистрироваться'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  textStyle: TextStyle(fontSize: 17),
                  backgroundColor: const Color.fromARGB(255, 90, 35, 241),
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              ),
            ),
        ],
      ),
      ),
      
    );
  }

}