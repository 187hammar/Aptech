import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/deliveries.dart';
import '../widgets/deliveryCard.dart';

class DeliveriesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deliveriesData = Provider.of<Deliveries>(context);
    final deliveries = deliveriesData.deliveryItems;
    return ListView.builder(
      itemCount: deliveries.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: deliveries[i],
        child: DeliveryCard(),
      ),
    );
  }
}
