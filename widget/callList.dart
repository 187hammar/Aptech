import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './callCard.dart';
import '../providers/calls/calls.dart';

class CallsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final callsData = Provider.of<Calls>(context);
    final calls = callsData.callItems;
    return ListView.builder(
      itemCount: calls.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: calls[i],
        child: CallCard(),
      ),
    );
  }
}
