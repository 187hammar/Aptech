import 'package:flutter/foundation.dart';

class Call with ChangeNotifier {
  final String id;
  final String patientName;
  final String address;
  bool sendCall;
  bool callAccepted;
  bool callRejected;

  Call({
    @required this.id,
    @required this.patientName,
    @required this.address,
    @required this.callAccepted,
    @required this.callRejected,
    @required this.sendCall,
  });
}
