import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thoughts_flutter/data/controller/inspiration_controller.dart';
import 'package:thoughts_flutter/widgets/app_bar.dart';
import 'package:thoughts_flutter/widgets/small_text.dart';

class InspirationPage extends StatefulWidget {
  const InspirationPage({Key? key}) : super(key: key);

  @override
  State<InspirationPage> createState() => _InspirationPageState();
}

class _InspirationPageState extends State<InspirationPage> {
  @override
  Widget build(BuildContext context) {
    var quotes = Get.find<InspirationController>().quotes;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar0(topic: "Inspirational Thoughts"),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image(
              alignment: Alignment(0, -1),
              image: AssetImage("assets/images/insBg2.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          GetBuilder<InspirationController>(builder: (inspirationCont) {
            return inspirationCont.quotes.length == 0
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Container(
                    // padding: EdgeInsets.only(top: 15),
                    child: RefreshIndicator(
                      color: Colors.white,
                      onRefresh: () {
                        return Future.delayed(Duration(milliseconds: 1500), () {
                          setState(() {
                            inspirationCont.getInspirationList();
                            // print("Refreshed!");
                          });
                        });
                      },
                      child: ListView.builder(
                        itemCount: inspirationCont.quotes.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(
                                left: 15, right: 15, top: 30, bottom: 5),
                            // height: 50,
                            // color: Colors.red,
                            child: SmallText(
                                text: inspirationCont.quotes[index].quote! +
                                    (inspirationCont.quotes[index].author ==
                                            null
                                        ? "Unknown"
                                        : (' - ' +
                                            inspirationCont
                                                .quotes[index].author!))),
                          );
                        },
                      ),
                    ),
                  );
          }),
        ],
      ),
    );
  }
}
