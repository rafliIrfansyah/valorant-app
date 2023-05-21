import 'package:flutter/material.dart';
import 'package:valorant_app/common/styles.dart';
import 'package:valorant_app/data/model/bundles.dart';
import 'package:valorant_app/views/bundle_details.dart';

class CardBundles extends StatelessWidget {
  final Data bundles;
  final BundlesPrice price;
  const CardBundles({super.key, required this.bundles, required this.price});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    BundleDetails(bundleId: bundles.uuid!, price: price,)));
      },
      child: Card(
        color: secondaryColor,
        child: Column(
          children: [
            Expanded(
              child: Image.network(
                bundles.displayIcon!,
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
