import 'package:amazon_clone/features/screens/account/widget/accountbutton.dart';
import 'package:flutter/material.dart';

class TopButton extends StatefulWidget {
  const TopButton({super.key});

  @override
  State<TopButton> createState() => _TopButtonState();
}

class _TopButtonState extends State<TopButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            AccountButton(
              title: "Your Orders",
              ontap: () {},
            ),
            AccountButton(
              title: "Turn seller",
              ontap: () {},
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            AccountButton(
              title: "Log out",
              ontap: () {},
            ),
            AccountButton(
              title: "Your Wish List",
              ontap: () {},
            )
          ],
        )
      ],
    );
  }
}
