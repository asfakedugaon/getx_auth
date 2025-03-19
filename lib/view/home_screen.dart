import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_auth_test/auth_controller/user_controller.dart';
import 'package:getx_auth_test/view/order_screen.dart';
import 'package:getx_auth_test/view/show_api_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   var apiController = Get.put(UserController());

   @override
  void initState() {
    super.initState();
    apiController.getApi();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api Calling Page"),
        actions: [
          IconButton(onPressed: () {
            apiController.fetchOrders().then((_) {
              Get.to(() => OrderScreen());
            });
          }, icon: Icon(Icons.shopping_bag))
        ],
      ),
      body:  Obx(() => GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 0.75,
        ),
        itemCount: apiController.productList.length,
        itemBuilder: (context, index) {
          if (apiController.productList.isNotEmpty) {
            var data = apiController.productList[index];
            return GestureDetector(
              onTap: () {
                Get.to(()=> ShowApiData(product: data, userController: Get.find<UserController>(),));
              },
              child: Card(
                elevation: 4.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Image.network(
                        data.image ?? '',
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        data.title ?? '',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      )),
    );
  }
}
