import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// 2 tham số , email và password - hàm signup 
// async và await để sử lý các hàm không đồng bộ 


// async là để khai báo 1 hàm không đồng bộ , khai báo asynchronous thì mới có await 

Future<void> signup(BuildContext context, String email, String password) async {
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email, password: password);
    print('/////// Success ////////');
  } on FirebaseAuthException catch (e) {
    if (e.code == 'email-already-in-use') {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Lỗi đăng nhập'),
            content: Text('Email bạn đã sử dụng !!!'),
            actions: [
              TextButton(
                child: Text('Đóng'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      return; // Ngăn không cho phép vào trang web
    } else {
      print(e);
    }
  } catch (e) {
    print(e);
  }
}



Future<void> signin(BuildContext context,String email, String password) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email, password: password);
    print('/////// Success ////////');
  } on FirebaseAuthException catch (e) {

    if (e.code == 'user-not-found' || e.code == 'wrong-password') {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Lỗi đăng nhập'),
            content: Text('Email hoặc mật khẩu không đúng.'),
            actions: [
              TextButton(
                child: Text('Đóng'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }
}
