import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:module_a/model/user.dart';


class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _login = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  
  bool _visible_password = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Регистрация'),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[200],
      body: Padding(padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 35.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextField(
            controller: _login,
            decoration: InputDecoration(
              labelText: 'Логин',
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
               contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
               
            ),
          ),
          const SizedBox(height: 1),
          TextField(
            controller: _email,
            decoration: InputDecoration(
              labelText: 'Почта',
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
               contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
               
            ),
          ),
          const SizedBox(height: 1),
          TextField(
            controller: _password,
            obscureText: _visible_password,
            decoration: InputDecoration(
              labelText: 'Пароль',
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
               contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
               suffixIcon: IconButton(
                  icon: Icon(
                    _visible_password ? Icons.visibility_off : Icons.visibility, 
                    color: Colors.grey[400],
                  ),
                  onPressed: () {
                    setState(() {
                      _visible_password = !_visible_password; 
                    });
                  },
                ),
            ),
          ),
           Spacer(),
             SizedBox(
              width: double.infinity, 
              child: Padding(padding: const EdgeInsets.symmetric(horizontal: 10).copyWith(bottom: 20),
              child:  ElevatedButton(
                onPressed: () async {
  var box = await Hive.openBox<User>('userBox');

  bool userExists = box.values.any((user) => user.login == _login.text);

  if (!userExists) {
    var user = User(
      login: _login.text, 
      password: _password.text, 
      email: _email.text,
      isAuthenticated: false,
    );
    await box.put('userKey', user);
    Navigator.pop(context); 
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Пользователь с таким логином уже существует!')),
    );
  }
},


                child: Text('Создать аккаунт'),
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
            SizedBox(height: 10),
            ],
          ),
      )

    );
  }


}
