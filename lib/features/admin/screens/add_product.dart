import 'dart:io';

import 'package:amazon_clone/constatn/utils.dart';
import 'package:amazon_clone/features/admin/admin_services/sell_product.dart';
import 'package:amazon_clone/features/admin/screens/admin_screen.dart';
import 'package:amazon_clone/features/auth/widgets/customelevatedbutton.dart';
import 'package:amazon_clone/features/auth/widgets/textinput.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import "package:flutter/material.dart";

import '../../../constatn/globalvariable.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});
  static const String routename = "admin/myproduct/addproduct";
  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  TextEditingController productnamecontroller = TextEditingController();
  TextEditingController discriptioncontroller = TextEditingController();
  TextEditingController pricecontroller = TextEditingController();
  TextEditingController qualtitycontroller = TextEditingController();
  String catagory = GlobalVariable.categoryImages[0]['title']!;
  List<File> images = [];
  AdminServices adminServices = AdminServices();

  final _addproductkey = GlobalKey<FormState>();
  @override
  void dispose() {
    // TODO: implement dispose
    pricecontroller.dispose();
    productnamecontroller.dispose();
    discriptioncontroller.dispose();
    qualtitycontroller.dispose();
    super.dispose();
  }

  void selectImages() async {
    var res = await imagepeaker();
    setState(() {
      images = res;
    });
  }

  void sellproduct() {
    if (_addproductkey.currentState!.validate() && images.isNotEmpty) {
      adminServices.sellProduct(
          context: context,
          productname: productnamecontroller.text,
          description: discriptioncontroller.text,
          price: double.parse(pricecontroller.text),
          qualtity: double.parse(qualtitycontroller.text),
          category: catagory,
          images: images);
    }
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
              "Add Product",
              style: TextStyle(color: Colors.black),
            )),
      ),
      body: Form(
        key: _addproductkey,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
              child: Column(children: [
                SizedBox(
                  height: 20,
                ),
                images == null || images.isEmpty
                    ? GestureDetector(
                        onTap: selectImages,
                        child: DottedBorder(
                            radius: const Radius.circular(10),
                            strokeCap: StrokeCap.round,
                            borderType: BorderType.RRect,
                            dashPattern: [10, 4],
                            child: Container(
                              width: double.infinity,
                              height: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.folder_open_outlined,
                                        size: 40),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      "Select Product Image ",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.grey.shade400),
                                    ),
                                  ]),
                            )),
                      )
                    : CarouselSlider(
                        items: images.map(
                          (e) {
                            return Builder(
                              builder: (BuildContext context) => Image.file(
                                e,
                                fit: BoxFit.fill,
                                height: 200,
                              ),
                            );
                          },
                        ).toList(),
                        options: CarouselOptions(
                            viewportFraction: 1, height: 200, autoPlay: true),
                      ),
                SizedBox(
                  height: 40,
                ),
                CustomTextInputfeild(
                    controller: productnamecontroller,
                    hint: "Enter productname"),
                SizedBox(
                  height: 10,
                ),
                CustomTextInputfeild(
                  controller: discriptioncontroller,
                  hint: "Enter Discription",
                  maxline: 7,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextInputfeild(
                    controller: pricecontroller, hint: "Enter Price"),
                SizedBox(
                  height: 10,
                ),
                CustomTextInputfeild(
                    controller: qualtitycontroller, hint: "Enter Qualtity"),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  child: DropdownButton(
                    value: catagory,
                    items: GlobalVariable.categoryImages.map((e) {
                      return DropdownMenuItem(
                        child: Text(e["title"] ?? "Null"),
                        value: e["title"],
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        catagory = value!;
                      });
                    },
                    icon: Icon(Icons.keyboard_arrow_down_outlined),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomElevatedBustton(
                    text: "sell",
                    ontap: () {
                      sellproduct();
                    }),
                SizedBox(
                  height: 10,
                ),
              ]),
            )),
      ),
    );
  }
}
