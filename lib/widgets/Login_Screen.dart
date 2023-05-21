import 'package:flutter/material.dart';
import 'package:thirty_widgets/authFunctions.dart';

import 'Weather_screen.dart';
// import 'package:thirty_widgets/widgets/Weather_screen.dart';

class Day24Authentication extends StatefulWidget {
  const Day24Authentication({Key? key}) : super(key: key);

  @override
  _Day24AuthenticationState createState() => _Day24AuthenticationState();
}

class _Day24AuthenticationState extends State<Day24Authentication> {
  // globalkey : để đảm bảo rằng có thể truy cập trạng thái của form 
  final _formkey = GlobalKey<FormState>(); // dùng để xác thực và lưu trữ trạng thái form 
  bool isLogin = false;  
  String email = '';
  String password = '';
  String username = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trang Đăng Nhập'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/sign_in_bg.jpg'), // Replace 'assets/background_image.jpg' with your actual image path
            fit: BoxFit.cover,
          ),
        ),
        child: Form(
          key: _formkey,  // global key : xác định và quản lý trạng thái form 
          child: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                !isLogin
                    ? TextFormField(   // textform để nhập dữ liệu 
                        key: ValueKey('username'),  // xác định widget trong widget tree, dùng để tìm kiếm, tương tác 
                        decoration: InputDecoration(hintText: "Enter Username"), // thiết lập gioa diện 
                        validator: (value) {  // hàm kiểm tra tính hợp lệ của text nhập vào 
                          if (value.toString().length < 3) {
                            return 'Username is too small';
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) { // khi giá trị của textform được lưu trữ thì sẽ gán username = value, value là giá tị người dung nhập vào  
                          setState(() {
                            username = value!;
                          });
                        },
                      )
                    : Container(),
                TextFormField(  
                  // nhập email 
                  key: ValueKey('email'),
                  decoration: InputDecoration(hintText: "Enter Email"),
                  validator: (value) {
                    if (!(value.toString().contains('@'))) {
                      return 'Invalid Email';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    setState(() {
                      email = value!;
                    });
                  },
                ),
                TextFormField(
                  obscureText: true,
                  key: ValueKey('password'),
                  decoration: InputDecoration(hintText: "Enter Password"),
                  validator: (value) {
                    if (value.toString().length < 6) {
                      return 'Password is too small';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    setState(() {
                      password = value!;
                    });
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(   

                    onPressed: () { // ấn vào thì thực hiện 
                      if (_formkey.currentState!.validate()) {   // kiểm tra tính hợp lệ của text trong form 
                        _formkey.currentState!.save();   // nếu mà hợp lệ thì sẽ lưu trữ dữ liệu từ form 
                        isLogin ? signin(context,email, password) : signup(context,email, password);  // kiểm tra xem islogin như nòa để vô sign in or sign up 
                        Navigator.push(
                          context,
                          // chuyển từ màn hình hiện tại -> hiển thị nội dung của widget app   
                          MaterialPageRoute(builder: (context) => App()),  // để nhảy sang trang weather
                        );
                      }
                    },
                    child: isLogin ? Text('Login') : Text('Signup'),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextButton(  // 
                  onPressed: () {
                    setState(() { // chuyển đổi 2 chế độ đ
                      isLogin = !isLogin;
                    });
                  },
                  child: isLogin
                      ? Text("Don't have an account? Signup")
                      : Text('Already Signed Up? Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
