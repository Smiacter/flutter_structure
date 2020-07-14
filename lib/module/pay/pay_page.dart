import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

/// tab - 付款
class PayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container( 
      color: Colors.green,
      child: FlareActor(  
        "assets/flrs/no_connection.flr",
        animation: "no_connection",
      ),
    );
  }
}