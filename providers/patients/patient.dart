import 'package:flutter/foundation.dart';

class Patient with ChangeNotifier {
  final String id;
  final String fullName;
  final String address;
  final String phoneNum;
  final String lastCall;

  Patient({
    @required this.id,
    @required this.fullName,
    @required this.address,
    @required this.phoneNum,
    @required this.lastCall,
  });
}
