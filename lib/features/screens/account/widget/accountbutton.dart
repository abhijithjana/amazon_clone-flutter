import 'package:flutter/material.dart';

class AccountButton extends StatelessWidget {
  final VoidCallback ontap;
  final String title;
  const AccountButton({super.key, required this.title, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0),
        height: 40.0,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 0.0),
            borderRadius: BorderRadius.circular(50.0),
            color: Colors.white),
        child: OutlinedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.black12.withOpacity(0.03),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0))),
          onPressed: ontap,
          child: Text(
            title,
            style:
                TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
          ),
        ),
      ),
    );
  }
}
