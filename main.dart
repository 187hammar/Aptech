import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/home.dart';
import './screens/availableDoctorsScreen.dart';
import './screens/patientDetailScreen.dart';
import './screens/deliveryDetailsScreen.dart';
import './screens/doctorDetailScreen.dart';
import './providers/doctors.dart';
import './providers/calls/calls.dart';
import './widget/mapOverview.dart';
import './doctors-side/doctor-screens/viewCalls.dart';
import './providers/patients/patients.dart';
import './deliverySide/deliveryHome.dart';
import './deliverySide/providers/deliveries.dart';
import './providers/auth.dart';
import './screens/auth_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: Doctors(),
          ),
          ChangeNotifierProvider.value(
            value: Calls(),
          ),
          // ChangeNotifierProxyProvider<Auth, Patients>(
          //   builder: (ctx, auth, previousPatients) => Patients(
          //     auth.token,
          //     previousPatients == null ? [] : previousPatients.patientsItem,
          //   ),
          // ),
          ChangeNotifierProvider.value(
            value: Deliveries(),
          ),
          ChangeNotifierProvider.value(
            value: Auth(),
          ),
        ],
        child: MaterialApp(
            title: 'Pocket Doctor',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: AuthScreen(),
            routes: {
              AvailableDoctorsScreen.routeName: (ctx) =>
                  AvailableDoctorsScreen(),
              MapOverview.routeName: (ctx) => MapOverview(),
              DoctorDetailScreen.routeName: (ctx) => DoctorDetailScreen(),
              ViewCalls.routeName: (ctx) => ViewCalls(),
              PatientDetailScreen.routeName: (ctx) => PatientDetailScreen(),
              DeliveryHomeScreen.routeName: (ctx) => DeliveryHomeScreen(),
              DeliveryDetailsScreen.routeName: (ctx) => DeliveryDetailsScreen(),
            }));
  }
}
