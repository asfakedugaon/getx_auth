import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_auth_test/auth_controller/user_controller.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Orders"),
      ),
      body: Obx(() => ListView.builder(
        itemCount: userController.orderList.length,
          itemBuilder: (context, index) {
          var order = userController.orderList[index];
          return Card(
            child: ListTile(
              leading: Image.network(order['image'] ?? ''),
              title: Text(order['title'] ?? ''),
              subtitle: Text("\$${order['price']?.toStringAsFixed(2) ?? 'N/A'}"),
              trailing: Text(order['category'] ?? ''),
            ),
          );
          },)),
    );
  }
}
