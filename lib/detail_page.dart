import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  String content;
  DetailPage({this.content = '要約'});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('要約'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: Text(content,
            style: Theme.of(context).textTheme.headlineSmall,
          ),),
      ),
    );
  }
}