import 'package:flutter/foundation.dart';

class Delivery with ChangeNotifier {
  final String id;
  final String patientName;
  final String doctorsName;
  final String practiceAddress;
  final String toAddress;

  Delivery({
    @required this.id,
    @required this.patientName,
    @required this.doctorsName,
    @required this.toAddress,
    @required this.practiceAddress,
  });
}
