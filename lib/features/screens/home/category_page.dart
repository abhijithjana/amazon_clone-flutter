import 'package:amazon_clone/constatn/buffering.dart';
import 'package:amazon_clone/constatn/globalvariable.dart';
import 'package:amazon_clone/features/screens/home/homeservice/categoryproduct.dart';
import 'package:amazon_clone/features/screens/product_details/screens/product_details.dart';
import 'package:amazon_clone/model/productmodel.dart';
import 'package:flutter/material.dart';

class CategorPage extends StatefulWidget {
  static const String routename = "home/category";
  final String category;
  const CategorPage({super.key, required this.category});

  @override
  State<CategorPage> createState() => _CategorPageState();
}

class _CategorPageState extends State<CategorPage> {
  List<ProductModel>? products;
  @override
  void initState() {
    fetch();
    // TODO: implement initState
    super.initState();
  }

  void fetch() async {
    products = await CategoryProduct()
        .fetchproduct(context: context, category: widget.category);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
            flexibleSpace: Container(
              decoration:
                  const BoxDecoration(gradient: GlobalVariable.appBarGradient),
            ),
            title: Text(
              widget.category,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  fontSize: 24),
            )),
      ),
      body: products == null
          ? Loading()
          : Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Keep shopping ${widget.category}',
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 170,
                  child: GridView.builder(
                    padding: const EdgeInsets.only(left: 15),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            mainAxisSpacing: 10,
                            childAspectRatio: 1.4),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, ProductDetail.Routename,
                              arguments: products![index]);
                        },
                        child: Column(
                          children: [
                            SizedBox(
                              height: 130,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black12, width: 0.5),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child:
                                      Image.network(products![index].images[0]),
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              padding: const EdgeInsets.only(
                                left: 0,
                                right: 15,
                                top: 5,
                              ),
                              child: Text(
                                products![index].name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: products!.length,
                    scrollDirection: Axis.horizontal,
                  ),
                )
              ],
            ),
    );
  }
}
