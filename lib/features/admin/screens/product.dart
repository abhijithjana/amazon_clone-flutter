import 'package:amazon_clone/constatn/buffering.dart';
import 'package:amazon_clone/features/admin/admin_services/sell_product.dart';
import 'package:amazon_clone/features/admin/screens/add_product.dart';
import 'package:amazon_clone/features/screens/account/widget/singleproduct.dart';
import 'package:amazon_clone/model/productmodel.dart';
import 'package:flutter/material.dart';

class Myproduct extends StatefulWidget {
  const Myproduct({super.key});

  @override
  State<Myproduct> createState() => _MyproductState();
}

class _MyproductState extends State<Myproduct> {
  List<ProductModel>? products;
  @override
  void initState() {
    productlist();
    super.initState();
  }

  void productlist() async {
    products = await AdminServices().fetchallproduct(context);

    setState(() {});
  }

  void deleteproduct(productdata, index) async {
    AdminServices().deleteproduct((productdata.id).toString(), context, () {
      products!.removeAt(index);
    });
    productlist();
  }

  @override
  Widget build(BuildContext context) {
    return products == null
        ? const Loading()
        : Scaffold(
            body: GridView.builder(
              itemCount: products!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                final productdata = products![index];
                return Column(
                  children: [
                    SizedBox(
                      height: 140,
                      child: SingleProduct(
                        src: productdata.images[0],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                            child: Text(
                          productdata.name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        )),
                        IconButton(
                            onPressed: () {
                              deleteproduct(productdata, index);
                            },
                            icon: Icon(Icons.delete_outline))
                      ],
                    )
                  ],
                );
              },
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                dynamic res =
                    await Navigator.pushNamed(context, AddProduct.routename);

                print(res);
                if (res != null) {
                  productlist();
                }
              },
              child: Icon(Icons.add),
              tooltip: "Add product",
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
  }
}
