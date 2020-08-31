import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:listtodo_get/controllers/InitOnboardingController.dart';
import 'package:listtodo_get/screens/HomeScreen.dart';

class GetXOnboarding extends StatelessWidget {
  final InitOnboardingController initOnboardingController = Get.put<InitOnboardingController>(InitOnboardingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: PageView(
          controller : initOnboardingController.pageController,
          onPageChanged: (value) => initOnboardingController.onPageChanged(value),
          children: [
            Stack(children: [
              PurpleCircle(leftPosition: 180, rightPosition: -100,opacityPosition: 0.5),
              ImageAndText(image: 'assets/githubpet.png',title: "Sample Text",paragraph: "Lorem  ipsum  dolor  sit  amet,  con  sectetur  adipiscing  elit.  Aenean  im  perdiet  ex  tellus, sit  amet,  con  sectetur  adipiscing",),
              ],
            ),
            Stack(children: [
              PurpleCircle(leftPosition: -225, rightPosition: -104,opacityPosition: 0.5),
              PurpleCircle(leftPosition: 240, rightPosition: -30,opacityPosition: 0.75),
              ImageAndText(image: 'assets/githubpet.png',title: "Sample Text",paragraph:"Lorem  ipsum  dolor  sit  amet,  con  sectetur  adipiscing  elit.  Aenean  im  perdiet  ex  tellus, sit  amet,  con  sectetur  adipiscing",),
              ],
            ),
            Stack(children: [
              PurpleCircle(leftPosition: 240, rightPosition: -190,opacityPosition: 0.5),
              PurpleCircle(leftPosition: -166, rightPosition: -31,opacityPosition: 0.75),
              ImageAndText(image: 'assets/githubpet.png',title: "Sample Text",paragraph: "Lorem  ipsum  dolor  sit  amet,  con  sectetur  adipiscing  elit.  Aenean  im  perdiet  ex  tellus, sit  amet,  con  sectetur  adipiscing",button: true),
              ],
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Indicator(indicatorIndex: 0,),
            Indicator(indicatorIndex: 1,),
            Indicator(indicatorIndex: 2,),
          ],
        ),
    );
  }
}

class PurpleCircle extends StatelessWidget {
  const PurpleCircle({
    Key key,
    @required this.leftPosition,
    @required this.rightPosition,
    @required this.opacityPosition,
  }) : super(key: key);

  final double leftPosition;
  final double rightPosition;
  final double opacityPosition;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: leftPosition,
      top: rightPosition,
      child: Container(
        width: 300,
        height: 300,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color.fromRGBO(115, 49, 130, opacityPosition)),
      )
    );
  }
}

class ImageAndText extends StatelessWidget {
  
  const ImageAndText({
    Key key,
    this.image,
    this.title,
    this.paragraph,
    this.button = false,
  }) : super(key: key);
  final String image;
  final String title;
  final String paragraph;
  final bool button;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(left:50,right:50),
        child: Column(children: [
          SizedBox(
            height: 200,
          ),
          Container(
            width: 200,
            height: 200,
            child: Image(
              image: AssetImage(image)
            )
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              title,
              style: TextStyle(fontSize:18,color: Color(0xff733182),fontWeight: FontWeight.bold),
              )
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              paragraph,
              style: TextStyle(fontSize:14,),
              )
          ),
          SizedBox(height: 38,),
          if(button != false)
            InkWell(
              onTap: (){
                Get.to(HomeScreen());
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xff51A382),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 100,
                height: 40,
                child: Center(
                  child: Text(
                    "List To do",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16
                      ),
                    ),
                ),
              ),
            ),
          ]),
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  final indicatorIndex;
  final InitOnboardingController initOnboardingController = Get.find();

  Indicator({this.indicatorIndex});
  @override
  Widget build(BuildContext context) {
    print("asd "+indicatorIndex.toString()+ " "+ initOnboardingController.index.toString());
    return Container(
      height: 8,
      width: 8,
      margin: EdgeInsets.all(4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: initOnboardingController.index == indicatorIndex ? Colors.black87 : Colors.grey,
      ),
    );
  }
}