import 'package:flutter/material.dart';

//to code later
class MessagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Message'),
      ),
      body: Center(
        child: Text(
          'Message Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
