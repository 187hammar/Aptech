import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../deliverySide/providers/delivery.dart';
import '../../screens/deliveryDetailsScreen.dart';

class DeliveryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final delivery = Provider.of<Delivery>(context);
    return GestureDetector(
      onTap: () => {
        Navigator.of(context).pushNamed(
          DeliveryDetailsScreen.routeName,
          arguments: delivery.id,
        )
      },
      child: Card(
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 3,
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            title: Text(delivery.toAddress),
            subtitle: Text(delivery.patientName),
          ),
        ),
      ),
    );
  }
}
