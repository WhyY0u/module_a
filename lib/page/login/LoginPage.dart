
import 'package:flutter/material.dart';
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
      backgroundColor: Colors.grey[200],
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
                onPressed: () {
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