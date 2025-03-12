import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_auth_test/model/product_store_model.dart';

import '../model/product_model.dart';
import '../view/home_screen.dart';
import 'package:http/http.dart' as http;

class UserController extends GetxController {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  var isEmailValid = true.obs;
  var isPasswordValid = true.obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  RxList productList = <ProductModel>[].obs;
  RxList productStoreList = <ProductStoreModel>[].obs;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void signUp() async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      if (userCredential.user != null) {
        emailController.clear();
        passwordController.clear();
        Get.snackbar("Success", "Signed Up Successfully!",
            colorText: Colors.white, backgroundColor: Colors.green);
        Get.to(HomeScreen());
      }
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error", e.message ?? "Sign Up Failed",
          colorText: Colors.white, backgroundColor: Colors.redAccent);
    }
  }

  void login() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      if (userCredential.user != null) {
        emailController.clear();
        passwordController.clear();
        Get.snackbar("Success", "Logged in Successfully!",
            colorText: Colors.white, backgroundColor: Colors.green);
        Get.to(HomeScreen());
      }
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error", e.message ?? "Login Failed",
          colorText: Colors.white, backgroundColor: Colors.redAccent);
    }
  }

  Future<void> fetchApi() async{
    final response = await http.get(Uri.parse("https://fakestoreapi.com/products"));
    if(response.statusCode == 200){
      List<dynamic> result = jsonDecode(response.body);
      productList.value = result.map((e) => ProductModel.fromJson(e),).toList();
      print(result);
    }
  }

  Future<void> saveOrderToFirestore(ProductModel product) async{
    try {
      await _firestore.collection('orders').add({
        'image': product.image,
        'title': product.title,
        'price': product.price,
        'description': product.description,
      });
      Get.snackbar("Success", "Order saved successfully!",
      colorText: Colors.white,backgroundColor: Colors.green);
    } catch(e) {
      Get.snackbar("Error", "Failed to save order: ${e.toString()}",
      colorText: Colors.white, backgroundColor: Colors.redAccent);
    }
  }
}