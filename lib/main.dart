import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:thirty_widgets/widgets/Login_Screen.dart';


Future<void> main() async {
  
  WidgetsFlutterBinding.ensureInitialized(); // đảm bảo rằng flutter chạy được khi chạy app

  // await : chờ cho hàm này chạy ( future chạy xong thì mới chạy tiếp hàm main - runapp)
  await Firebase.initializeApp(); // khơi tạo và cấu hình firebase trong ứng dụng 
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, // tắt dấu debug 
        title: 'Weather Forecast Application',
        theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.purple,
        ),
        home: Day24Authentication());
  }
}
