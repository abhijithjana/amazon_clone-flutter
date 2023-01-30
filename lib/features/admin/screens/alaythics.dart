import 'package:amazon_clone/constatn/buffering.dart';
import 'package:amazon_clone/features/admin/admin_services/services.dart';
import 'package:amazon_clone/features/admin/model/sales.dart';
import 'package:amazon_clone/features/admin/screens/admin_screen.dart';
import 'package:flutter/material.dart';

class Alaylatics extends StatefulWidget {
  const Alaylatics({super.key});

  @override
  State<Alaylatics> createState() => _AlaylaticsState();
}

class _AlaylaticsState extends State<Alaylatics> {
  int? totalearning;
  List<Sales>? sale;

  void getearning() async {
    var earningdata = await AdminServices().getearning(context: context);
    totalearning = earningdata['totalearning'];
    sale = earningdata['sales'];
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getearning();
  }

  @override
  Widget build(BuildContext context) {
    return totalearning == null || sale == null
        ? const Loading()
        : Column(
            children: [
              Text(
                '${totalearning}',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )
            ],
          );
  }
}
