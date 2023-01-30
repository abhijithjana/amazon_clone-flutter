import 'package:amazon_clone/constatn/globalvariable.dart';
import 'package:amazon_clone/constatn/utils.dart';
import 'package:amazon_clone/features/address/services/addressScreenservices.dart';
import 'package:amazon_clone/features/auth/widgets/customelevatedbutton.dart';
import 'package:amazon_clone/features/auth/widgets/textinput.dart';
import 'package:amazon_clone/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pay/pay.dart';

class AddressScreen extends StatefulWidget {
  final String totalamaount;
  static const String routename = "order/address";
  const AddressScreen({super.key, required this.totalamaount});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final TextEditingController flatnoController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController townController = TextEditingController();

  void onGooglePayResult(paymentResult) {
    if (Provider.of<UserProvider>(context).user.address.isEmpty) {
      AddressScreenServices()
          .updateaddress(context: context, address: useaddress);
    }
    AddressScreenServices().placeorder(
        context: context,
        address: useaddress,
        totalprice: double.parse(widget.totalamaount));
  }

  final addresskey = GlobalKey<FormState>();
  List<PaymentItem> paymentitem = [];
  @override
  void initState() {
    paymentitem.add(
      PaymentItem(
        amount: widget.totalamaount,
        label: 'Total ammount',
        status: PaymentItemStatus.final_price,
      ),
    );
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    flatnoController.dispose();
    areaController.dispose();
    pincodeController.dispose();
    townController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  String useaddress = '';
  void onpayprees(String addressfromform) {
    AddressScreenServices().placeorder(
        context: context,
        address: useaddress,
        totalprice: double.parse(widget.totalamaount));
    useaddress = '';

    bool isform = flatnoController.text.isNotEmpty ||
        areaController.text.isNotEmpty ||
        pincodeController.text.isNotEmpty ||
        townController.text.isNotEmpty;

    if (isform) {
      if (addresskey.currentState!.validate()) {
        useaddress =
            '${flatnoController.text},${areaController.text},${townController.text}-${pincodeController.text}';
      } else {
        throw Exception('Please enter addresss');
      }
    } else if (addressfromform.isNotEmpty) {
      useaddress = addressfromform;
    } else {
      showSnakebar(context, 'Enter address');
    }
  }

  void onGPaymentResult(res) {}

  @override
  Widget build(BuildContext context) {
    final address = context.watch<UserProvider>().user.address;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration:
                const BoxDecoration(gradient: GlobalVariable.appBarGradient),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              if (address.isNotEmpty)
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          address,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'OR',
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              Form(
                key: addresskey,
                child: Column(
                  children: [
                    CustomTextInputfeild(
                      controller: flatnoController,
                      hint: "Flat , House no , Building",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextInputfeild(
                      controller: areaController,
                      hint: "Area,Street",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextInputfeild(
                      controller: pincodeController,
                      hint: "pincode",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextInputfeild(
                      controller: townController,
                      hint: "Town/City",
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    GooglePayButton(
                      paymentConfigurationAsset: 'gpay.json',
                      onPressed: () => onpayprees(address),
                      paymentItems: paymentitem,
                      type: GooglePayButtonType.buy,
                      width: double.infinity,
                      height: 50,
                      margin: const EdgeInsets.only(top: 15.0),
                      onPaymentResult: onGooglePayResult,
                      loadingIndicator: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // ApplePayButton(
                    //     paymentConfigurationAsset: 'applepay.json',
                    //     onPaymentResult: onGPaymentResult,
                    //     paymentItems: paymentitem),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
