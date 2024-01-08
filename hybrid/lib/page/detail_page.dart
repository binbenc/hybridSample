import 'package:flutter/material.dart';

import '../widget/appbar.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    // return Container(
    //   color: Colors.blue,
    // );
    return Scaffold(
      appBar: appBar("详情页", "", () {}),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.only(top: 30),
          )
        ],
      ),
    );
  }
}
