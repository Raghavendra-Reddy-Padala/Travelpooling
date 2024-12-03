import 'package:flutter/material.dart';

class DriverLogin extends StatefulWidget {
  const DriverLogin({super.key});

  @override
  State<DriverLogin> createState() => _DriverLoginState();
}

class _DriverLoginState extends State<DriverLogin> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:const Text("Rider page"),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('There is an issue in the server',style: TextStyle(color: Colors.red,fontSize: 30),),
      ),
    );
  }
}