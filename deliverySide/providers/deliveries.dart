import 'package:flutter/material.dart';

import './delivery.dart';

class Deliveries with ChangeNotifier {
  List<Delivery> _deliveryItems = [
    Delivery(
      id: 'd1',
      patientName: 'Thabo Mponya',
      doctorsName: 'Dr. M.Y. Mthetwa',
      toAddress: '10 Cannies street Akasia Pretoria',
      practiceAddress: '18 Cannies street Akasia Pretoria',
    ),
  ];

  List<Delivery> get deliveryItems {
    return [..._deliveryItems];
  }

  Delivery findById(String id) {
    return _deliveryItems.firstWhere((element) => element.id == id);
  }
}
