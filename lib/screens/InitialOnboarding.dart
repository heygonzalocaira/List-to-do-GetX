import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter/material.dart';
import 'package:listtodo_get/screens/HomeScreen.dart';
import 'package:get/get.dart';

class InitialOnboarding extends StatelessWidget {
  List<PageViewModel> getPages(){
    return [
        PageViewModel(
          image: Center(
            child: Image.network("https://github.githubassets.com/images/modules/logos_page/Octocat.png", height: 175.0),
          ),
          title: "Sample Text",
          body: "Welcome",
          //footer: Text("Footer Text here "),
          decoration: const PageDecoration(
            pageColor: Colors.blue,
          )
        ),
        PageViewModel(
          image: Center(
            child: Image.network("https://www.ayoungnotes.com/images/octocat_kenobi.jpg", height: 175.0),
          ),
          title: "List To Do 2 ",
          body: "List To Do Demo ",
          //footer: Text("Footer Text  here "),
        ),
        PageViewModel(
          title: "Title of first page",
          body: "Here you can write the description of the page, to explain someting...",
          image: Center(
            child: Image.network("https://www.ayoungnotes.com/images/octocat_kenobi.jpg", height: 175.0),
          ),
          footer: RaisedButton(
            color: Colors.greenAccent,
            shape: RoundedRectangleBorder(  
              borderRadius: new BorderRadius.circular(10.0), 
            ),
            onPressed: () {
              Get.to(HomeScreen());
            },
            child: const Text("Incia"),
          ),
        ),
    ];
  }
  @override
    Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        globalBackgroundColor: Colors.white,
        pages: getPages(),
        //showNextButton: true,
        showSkipButton: false,
        //skip: Text("Skip"),
        done: Container(child: Text("qweq"),),
        onDone: () {
        //  Get.to(HomeScreen());
        },
      ),
    );
  }
}