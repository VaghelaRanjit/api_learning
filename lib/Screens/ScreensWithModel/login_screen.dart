import 'package:api_learning/API_Services/api_services.dart';
import 'package:api_learning/Model/login_model.dart';
import 'package:api_learning/home_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginModel? loginModel; // object of model

  Future<LoginModel?> login() async {
    try {
      final loginUser = await ApiServices().userLoginWithModel(
        emailController.text.toString(),
        passwordController.text.toString(),
      );

      if (loginUser != null) {
        setState(() {
          loginModel = loginUser;
        });

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Here"), centerTitle: true),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: "Enter E-mail",
                  suffixIcon: Icon(Icons.mail, color: Colors.black),
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(height: 10),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: "Enter Password",
                  suffixIcon: Icon(Icons.lock, color: Colors.black),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),

              GestureDetector(
                // onTap: () async {
                //   var value = await ApiServices().userLoginWithModel(
                //     emailController.text,
                //     passwordController.text,
                //   );
                //
                //   if (value != null) {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => HomeScreen(),
                //       ),
                //     );
                //   } else {
                //     ScaffoldMessenger.of(context).showSnackBar(
                //       SnackBar(content: Text("Login Failed")),
                //     );
                //   }
                // },
                onTap: login,
                child: Container(
                  height: 70,
                  width: 360,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "LOGIN",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
