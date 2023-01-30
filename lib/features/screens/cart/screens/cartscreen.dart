import 'package:amazon_clone/constatn/globalvariable.dart';
import 'package:amazon_clone/features/address/screen/addressscreen.dart';
import 'package:amazon_clone/features/auth/widgets/customelevatedbutton.dart';
import 'package:amazon_clone/features/screens/cart/widget/cartproduct.dart';
import 'package:amazon_clone/features/screens/cart/widget/cartsubtotal.dart';
import 'package:amazon_clone/features/screens/home/widget/address_box.dart';
import 'package:amazon_clone/features/screens/search/screens/searchScreen.dart';
import 'package:amazon_clone/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cart = context.watch<UserProvider>().user.cart;
    int sum = 0;

    cart
        .map((product) =>
            sum += product['count'] * product['product']['price'] as int)
        .toList();
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AddressBox(),
            CartSubTotal(sum: sum),
            Padding(
              padding: const EdgeInsets.all(8),
              child: CustomElevatedBustton(
                text: 'Proceed to Buy (${cart.length} items)',
                color: Colors.yellow[600],
                ontap: () {
                  Navigator.pushNamed(context, AddressScreen.routename,
                      arguments: sum.toString());
                },
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              color: Colors.black12.withOpacity(0.5),
              height: 1,
            ),
            const SizedBox(
              height: 5,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: cart.length,
              itemBuilder: ((context, index) {
                return CArtProducts(index: index);
              }),
            )
          ],
        ),
      ),
    );
  }
}
