import 'package:amazon_clone/constatn/globalvariable.dart';
import 'package:amazon_clone/features/admin/admin_services/services.dart';
import 'package:amazon_clone/features/auth/widgets/customelevatedbutton.dart';
import 'package:amazon_clone/features/screens/search/screens/searchScreen.dart';
import 'package:amazon_clone/model/ordermodel.dart';
import 'package:amazon_clone/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class OrderdetailsScreen extends StatefulWidget {
  static const String routename = 'user/detail/order';
  final Order order;
  const OrderdetailsScreen({
    super.key,
    required this.order,
  });

  @override
  State<OrderdetailsScreen> createState() => _OrderdetailsScreenState();
}

class _OrderdetailsScreenState extends State<OrderdetailsScreen> {
  int currentstep = 0;
  @override
  void initState() {
    currentstep = widget.order.status;
    // TODO: implement initState
    super.initState();
  }

  // !!!!!!!!!!!!!!only for admin!!!!!!!!
  void updatestatus() {
    AdminServices().updateoderstatus(widget.order.id, context, currentstep, () {
      currentstep += 1;
      print('hh');
      setState(() {});
    });
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
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'View order details',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Order date :    ${DateFormat().format(
                      DateTime.fromMillisecondsSinceEpoch(widget.order.orderAt),
                    )}'),
                    Text('Order id :        ${widget.order.id}'),
                    Text('Total price :    ₹${widget.order.totalprice}'),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Products details',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      for (int i = 0; i < widget.order.products.length; i++)
                        Row(
                          children: [
                            Image.network(
                              widget.order.products[i]['product']['images'][0],
                              height: 120,
                              width: 120,
                            ),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  widget.order.products[i]['product']['name'],
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                    'Qty: ${widget.order.products[i]['count']}')
                              ],
                            ))
                          ],
                        )
                    ],
                  )),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Tracking',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                ),
                child: Stepper(
                    controlsBuilder: (context, details) {
                      if (Provider.of<UserProvider>(context, listen: false)
                              .user
                              .type ==
                          'admin') {
                        return CustomElevatedBustton(
                          ontap: updatestatus,
                          text: 'Done',
                        );
                      }
                      return SizedBox();
                    },
                    steps: [
                      Step(
                        title: const Text('Pending'),
                        content: const Text('Your order yet to be delivered'),
                        isActive: currentstep > 0,
                        state: currentstep > 0
                            ? StepState.complete
                            : StepState.indexed,
                      ),
                      Step(
                          title: const Text('Complete'),
                          content: const Text(
                              'Your order has been delivered, you are yet to sign'),
                          isActive: currentstep > 1,
                          state: currentstep > 1
                              ? StepState.complete
                              : StepState.indexed),
                      Step(
                          title: const Text('Received'),
                          content: const Text(
                              'Your order has been delivered and sign by you'),
                          isActive: currentstep > 2,
                          state: currentstep > 2
                              ? StepState.complete
                              : StepState.indexed),
                      Step(
                          title: const Text('Delivered'),
                          content: const Text(
                              'Your order has been delivered and sign by you!'),
                          isActive: currentstep >= 3,
                          state: currentstep >= 3
                              ? StepState.complete
                              : StepState.indexed),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
