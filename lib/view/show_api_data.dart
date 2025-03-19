import 'package:flutter/material.dart';
import 'package:getx_auth_test/auth_controller/user_controller.dart';
import 'package:getx_auth_test/model/product_model.dart';

class ShowApiData extends StatefulWidget {
  final ProductModel product;
  final UserController userController;
  const ShowApiData({super.key, required this.product, required this.userController});

  @override
  State<ShowApiData> createState() => _ShowApiDataState();
}

class _ShowApiDataState extends State<ShowApiData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product details"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network(
                 widget.product.image ?? '',
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20),
              Text(
                widget.product.title ?? '',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "\$${widget.product.price?.toStringAsFixed(2) ?? 'N/A'}",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.green,
                ),
              ),
              SizedBox(height: 20),
              Text(
                widget.product.description ?? '',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 40,vertical: 10),
                          backgroundColor: Colors.orange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )
                      ),
                      child: Text("Add to Cart")),
                  Spacer(),
                  ElevatedButton(onPressed: () {
                    widget.userController.saveOrderToFirestore(widget.product);
                  },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 40,vertical: 10),
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )
                      ),
                      child: Text("Buy")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
