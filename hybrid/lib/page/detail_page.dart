import 'package:flutter/material.dart';
import 'package:hybrid/page/personal_information_page.dart';

import '../utils/preference_utils.dart';
import '../widget/appbar.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    super.initState();
    // PreferenceUtils.perInit();
  }

  @override
  Widget build(BuildContext context) {
    // PreferenceUtils().setString("k1", "111");
    // print("PreferenceUtils key k1:" + PreferenceUtils().get("k1"));

    // return Scaffold(
    //   appBar: appBar("详情页", "", () {}),
    //   body: Column(
    //     children: [
    //       Container(
    //         color: Colors.white,
    //         padding: const EdgeInsets.only(top: 30),
    //       )
    //     ],
    //   ),
    // );

    return FutureBuilder<PreferenceUtils?>(
        future: PreferenceUtils.perInit(),
        builder:
            (BuildContext context, AsyncSnapshot<PreferenceUtils?> snapshot) {
          //加载完成进入HomePgae 否则就转圈
          Widget widget = snapshot.connectionState == ConnectionState.done
              ? const PersonalInformationPage()
              : Scaffold(
                  appBar: appBar("详情页", "", () {}),
                  body: const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
          return MaterialApp(
            home: widget,
            title: '这个title的内容应该显示在Android任务栏',
          );
        });
  }
}
