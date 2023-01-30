import 'package:amazon_clone/constatn/buffering.dart';
import 'package:amazon_clone/features/admin/admin_services/services.dart';
import 'package:amazon_clone/features/admin/screens/admin_screen.dart';
import 'package:amazon_clone/features/auth/services/auth_services.dart';
import 'package:amazon_clone/features/orderdetails.dart/screens/orderdetailsscreen.dart';
import 'package:amazon_clone/features/screens/account/widget/singleproduct.dart';
import 'package:amazon_clone/model/ordermodel.dart';
import 'package:flutter/material.dart';

class OrderedProduct extends StatefulWidget {
  const OrderedProduct({super.key});

  @override
  State<OrderedProduct> createState() => _OrderedProductState();
}

class _OrderedProductState extends State<OrderedProduct> {
  List<Order>? orderlist;
  @override
  void initState() {
    fetchorder();
    // TODO: implement initState
    super.initState();
  }

  void fetchorder() async {
    orderlist = await AdminServices().getoderproduct(context: context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return orderlist == null
        ? const Loading()
        : GridView.builder(
            itemCount: orderlist!.length,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index) {
              Order order = orderlist![index];
              return GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, OrderdetailsScreen.routename,
                    arguments: order),
                child: SingleProduct(
                    src: order.products[0]['product']['images'][0]),
              );
            });
  }
}
