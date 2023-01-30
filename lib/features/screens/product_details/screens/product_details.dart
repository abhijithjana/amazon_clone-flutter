import 'package:amazon_clone/constatn/globalvariable.dart';
import 'package:amazon_clone/constatn/star.dart';
import 'package:amazon_clone/features/auth/widgets/customelevatedbutton.dart';
import 'package:amazon_clone/features/screens/home/widget/address_box.dart';
import 'package:amazon_clone/features/screens/product_details/services/productdetailsevice.dart';
import 'package:amazon_clone/features/screens/search/screens/searchScreen.dart';
import 'package:amazon_clone/model/productmodel.dart';
import 'package:amazon_clone/provider/user_provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class ProductDetail extends StatefulWidget {
  static const String Routename = '/productdetails';
  final ProductModel product;
  const ProductDetail({super.key, required this.product});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  double avg = 0.0;
  double myrating = 0.0;
  @override
  void initState() {
    double totalrating = 0;

    for (int i = 0; i < widget.product.rating!.length; i++) {
      totalrating += widget.product.rating![i].rating;
      if (widget.product.rating![i].userid.toString() ==
          (Provider.of<UserProvider>(context, listen: false).user.id)
              .toString()) {
        myrating = myrating + widget.product.rating![i].rating;
      }
    }
    if (totalrating != 0) avg = totalrating / widget.product.rating!.length;
    super.initState();
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AddressBox(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text(widget.product.id!), Star(initialrating: avg)],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Text(
                '${widget.product.name}',
                style: const TextStyle(fontSize: 15),
              ),
            ),
            CarouselSlider(
              items: widget.product.images.map(
                (e) {
                  return Builder(
                    builder: (BuildContext context) => Image.network(
                      e,
                      fit: BoxFit.contain,
                      height: 200,
                    ),
                  );
                },
              ).toList(),
              options: CarouselOptions(
                  viewportFraction: 1, height: 300, autoPlay: true),
            ),
            Container(
              color: Colors.black12,
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: RichText(
                text: TextSpan(
                    text: 'Deal price: ',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    children: [
                      TextSpan(
                          text: '${widget.product.price}₹',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: Colors.red))
                    ]),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Text(widget.product.description),
            ),
            Container(
              color: Colors.black12,
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: CustomElevatedBustton(text: 'Buy now', ontap: () {}),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: CustomElevatedBustton(
                text: 'Add to cart',
                ontap: () {
                  ProductDetailService()
                      .addcart(context: context, product: widget.product);
                },
                color: Color.fromRGBO(254, 216, 19, 1),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.black12,
              height: 5,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Rate the product',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            RatingBar.builder(
                initialRating: myrating,
                allowHalfRating: true,
                minRating: 1,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 5),
                direction: Axis.horizontal,
                itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: GlobalVariable.secondaryColor,
                    ),
                onRatingUpdate: (rating) async {
                  ProductDetailService().rating(
                      context: context,
                      product: widget.product,
                      rating: rating);
                  setState(() {});
                })
          ],
        ),
      ),
    );
  }
}
