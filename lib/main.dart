import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:module_a/model/user.dart';
import 'package:module_a/navigator/Navigator.dart';
import 'package:module_a/page/login/LoginPage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:module_a/page/catalog/CatalogPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var appDocumentDir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocumentDir.path);
  Hive.registerAdapter(UserAdapter());  
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Module A',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const AuthChecker(),
    );
  }
}


class AuthChecker extends StatelessWidget {
  const AuthChecker({super.key});

  Future<bool> getAuth() async {
    var authBox = await Hive.openBox('authBox');
    bool isAuthenticated = authBox.get('isAuthenticated', defaultValue: false);
    return isAuthenticated;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(  
      future: getAuth(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return const Center(child: Text('Ошибка при проверке токена'));
        }

        if (snapshot.hasData && snapshot.data == true) {
          return const MainScreen();  
        }

        return LoginPage(); 
      },
    );
  }
}
