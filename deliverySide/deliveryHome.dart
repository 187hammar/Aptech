import 'package:flutter/material.dart';

import './widgets/deliveryList.dart';
import '../widget/appdrawer.dart';

class DeliveryHomeScreen extends StatefulWidget {
  static const routeName = "/delivery-home-screen";
  @override
  _DeliveryHomeScreenState createState() => _DeliveryHomeScreenState();
}

class _DeliveryHomeScreenState extends State<DeliveryHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Available Deliveries"),
      ),
      drawer: AppDrawer(),
      body: DeliveriesList(),
    );
  }
}
