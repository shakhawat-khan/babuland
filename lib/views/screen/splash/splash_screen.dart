import 'dart:async';

import 'package:babuland/views/screen/ticket_list/ticket_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState

    Timer(
        const Duration(seconds: 5),
        () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TicketList()),
            ));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SpinKitFadingFour(
            color: Theme.of(context).primaryColor,
            size: MediaQuery.of(context).size.width / 8,
          ),
        ],
      ),
    );
  }
}
