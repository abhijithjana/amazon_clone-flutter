import 'package:amazon_clone/constatn/buffering.dart';
import 'package:amazon_clone/constatn/globalvariable.dart';
import 'package:amazon_clone/features/screens/home/widget/address_box.dart';
import 'package:amazon_clone/features/screens/product_details/screens/product_details.dart';
import 'package:amazon_clone/features/screens/search/service/searchsrvice.dart';
import 'package:amazon_clone/features/screens/search/widget/searchwidget.dart';
import 'package:amazon_clone/model/productmodel.dart';
import 'package:flutter/material.dart';

class SeacrchScreens extends StatefulWidget {
  static const String Routename = "/search/product";
  final String searchelement;
  const SeacrchScreens({super.key, required this.searchelement});

  @override
  State<SeacrchScreens> createState() => _SeacrchScreensState();
}

class _SeacrchScreensState extends State<SeacrchScreens> {
  @override
  void initState() {
    fetchproduct();

    super.initState();
  }

  List<ProductModel>? products;
  void fetchproduct() async {
    products = await Searchservice().fetchsearchproduct(
        context: context, searchelement: widget.searchelement);
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
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                    padding: const EdgeInsets.only(left: 15),
                    height: 40,
                    child: Material(
                      elevation: 1,
                      borderRadius: BorderRadius.circular(7),
                      child: TextFormField(
                        onFieldSubmitted: (value) {
                          Navigator.pushNamed(context, SeacrchScreens.Routename,
                              arguments: value);
                        },
                        decoration: InputDecoration(
                            prefixIcon: InkWell(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.only(left: 6),
                                child: const Icon(
                                  Icons.search,
                                  color: Colors.black,
                                  size: 23,
                                ),
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.only(top: 8),
                            border: const OutlineInputBorder(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(7)),
                                borderSide: BorderSide.none),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(7)),
                                borderSide: BorderSide(
                                  color: Colors.black38,
                                  width: 1,
                                )),
                            hintText: "Search on amazon.in",
                            hintStyle: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                            )),
                      ),
                    )),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                color: Colors.transparent,
                height: 42,
                child: Icon(
                  Icons.mic,
                  color: Colors.black,
                  size: 25,
                ),
              )
            ],
          ),
        ),
      ),
      body: products == null
          ? const Loading()
          : Column(
              children: [
                AddressBox(),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: products!.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, ProductDetail.Routename,
                                    arguments: products![index]);
                              },
                              child: SearchWidget(products: products![index]));
                        })),
              ],
            ),
    );
  }
}
