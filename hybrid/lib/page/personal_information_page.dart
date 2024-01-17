import 'package:flutter/material.dart';

import '../utils/preference_utils.dart';
import '../widget/appbar.dart';

class PersonalInformationPage extends StatefulWidget {
  const PersonalInformationPage({super.key});

  @override
  State<PersonalInformationPage> createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformationPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PreferenceUtils().setString("k1", "111");
    print("PreferenceUtils key k1:" + PreferenceUtils().get("k1"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("个人信息页", "", () {}),
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
