import 'package:flutter/material.dart';

class AccountingPage extends StatefulWidget {
  const AccountingPage({super.key});

  @override
  State<AccountingPage> createState() => _AccountingPageState();
}

class _AccountingPageState extends State<AccountingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: const <Widget>[Text('Panel principal')]),
    );
  }
}
