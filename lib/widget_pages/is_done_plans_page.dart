import 'package:flutter/material.dart';

class IsDonePlansPage extends StatelessWidget {
  final int plansLength;
  final int donePlansLength;
  const IsDonePlansPage(this.plansLength, this.donePlansLength, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "$plansLength",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "$donePlansLength",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Barcha rejalaringiz",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              Text(
                "Bajarilgan rejalaringiz",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
