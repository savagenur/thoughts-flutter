import 'package:flutter/material.dart';
import 'package:thoughts_flutter/widgets/small_text.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({ Key? key }) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SmallText(text: "Settings",size: 25,),
centerTitle: true,
      ),
      body: Center(
      child: Text("Settings page"),
      
    ),
    );
  }
}