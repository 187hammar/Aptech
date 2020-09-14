import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            leading: IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {},
            ),
            title: Text('Hello'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.local_hospital),
            title: Text("Doctors"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
