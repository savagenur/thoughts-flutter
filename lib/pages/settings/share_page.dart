import 'package:flutter/material.dart';
import 'package:thoughts_flutter/widgets/small_text.dart';

class SharePage extends StatefulWidget {
  const SharePage({ Key? key }) : super(key: key);

  @override
  State<SharePage> createState() => _SharePageState();
}

class _SharePageState extends State<SharePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SmallText(text: "Share",size: 25,),
centerTitle: true,
      ),
      body: Center(
      child: Text("Share page"),
      
    ),
    );
  }
}