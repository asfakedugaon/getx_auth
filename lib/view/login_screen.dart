import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_auth_test/auth_controller/user_controller.dart';
import 'package:getx_auth_test/view/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final UserController userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Screen"),
      ),
      body: Center(
        child: Container(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: userController.emailController,
                decoration: InputDecoration(
                  hintText: 'Enter Email...',
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide: const BorderSide(
                          color: Colors.orange,
                          width: 2
                      )
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide: const BorderSide(
                          color: Colors.blueAccent,
                          width: 2
                      )
                  ),
                  prefixIcon: IconButton(
                    icon: Icon(Icons.person),
                    onPressed: () {},
                  ),
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                controller: userController.passwordController,
                decoration: InputDecoration(
                  hintText: 'Enter Password...',
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide: const BorderSide(
                          color: Colors.orange,
                          width: 2
                      )
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide: const BorderSide(
                          color: Colors.blueAccent,
                          width: 2
                      )
                  ),
                  prefixIcon: IconButton(
                    icon: Icon(Icons.lock),
                    onPressed: () {},
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account"),
                    TextButton(onPressed: () {
                      Get.to(SignupScreen());
                    }, child: Text('SignUp')),
                  ],
                ),
              ),
              ElevatedButton(onPressed: () {
                userController.login();
              }, child: Text("Login"))
            ],
          ),
        ),
      ),
    );
  }
}
