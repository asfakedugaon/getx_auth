import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_auth_test/auth_controller/user_controller.dart';
import 'package:getx_auth_test/view/home_screen.dart';
import 'package:getx_auth_test/view/login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  final UserController userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Page'),
      ),
      body: Center(
        child: Container(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: userController.nameController,
                decoration: InputDecoration(
                  hintText: 'Enter Name...',
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
                    const Text("I have an account"),
                    TextButton(onPressed: () {
                      Get.to(LoginScreen());
                    }, child: Text('Login')),
                  ],
                ),
              ),
              ElevatedButton(onPressed: () {
                userController.signUp();
              }, child: Text("SignUp"))
            ],
          ),
        ),
      ),
    );
  }
}
