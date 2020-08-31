import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:listtodo_get/screens/HomeScreen.dart';
import 'package:get/get.dart';

var color1 = Color(0xffffff);
var color2 = Color(0xffffff);
var color3 = Color(0xffffff);

List<String> image = ['https://github.githubassets.com/images/modules/logos_page/Octocat.png', 'https://github.githubassets.com/images/modules/logos_page/Octocat.png', 'https://github.githubassets.com/images/modules/logos_page/Octocat.png'];

List<String> title = [
  'Sample Text',
  'Sample Text',
  'Sample Text',
];

List<String> text = [
  'Lorem ipsum dolor sit amet consectetur adipiscing elit nec potenti, eros at id massa erat enim quam mattis morbi, parturient nunc lacus inceptos sapien quis non cras.',
  'Lorem ipsum dolor sit amet consectetur adipiscing elit nec potenti, eros at id massa erat enim quam mattis morbi, parturient nunc lacus inceptos sapien quis non cras.',
  'Lorem ipsum dolor sit amet consectetur adipiscing elit nec potenti, eros at id massa erat enim quam mattis morbi, parturient nunc lacus inceptos sapien quis non cras.',
];


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CarouselSlider carouselSlider;
  int carouselIndex = 0;

  @override
  Widget build(BuildContext context) {
    carouselSlider = CarouselSlider(
      viewportFraction: 1.0,
      enableInfiniteScroll: false,
      onPageChanged: (index) {
        setState(() {
          carouselIndex = index;
        });
      },
      height: MediaQuery.of(context).size.height,
      items: <Widget>[
        CarouselComponent(
          col1: color1,
          col2: color2,
          imgUrl: image[0],
          ttl: title[0],
          txt: text[0],
        ),
        CarouselComponent(
          col1: color2,
          col2: color3,
          imgUrl: image[1],
          ttl: title[1],
          txt: text[1],
        ),
        CarouselComponent(
          col1: color3,
          col2: color3,
          imgUrl: image[2],
          ttl: title[2],
          txt: text[2],
        ),
      ],
    );

    return Scaffold(
      floatingActionButton: carouselIndex == 2
          ? Container()
          : IconButton(
              icon: Icon(
                Icons.chevron_right,
                size: 30,
                color: Colors.white,
              ),
              onPressed: () {
                carouselSlider.nextPage(
                    duration: Duration(milliseconds: 500), curve: Curves.ease);
              }),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          carouselSlider,
          carouselIndex == 2
              ? Positioned(
                  bottom: 60,
                  child: MaterialButton(
                    color: Colors.green,
                    onPressed: () {
                      Get.to(HomeScreen());
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                    child: Text(
                      'Incia',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                )
              : ListIndicator(carouselIndex: carouselIndex),
        ],
      ),
    );
  }
}

class ListIndicator extends StatelessWidget {
  const ListIndicator({
    Key key,
    @required this.carouselIndex,
  }) : super(key: key);

  final int carouselIndex;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 50,
        child: Row(
          children: <Widget>[
            Indicator(
              carouselIndex: carouselIndex,
              indicatorIndex: 0,
            ),
            Indicator(
              carouselIndex: carouselIndex,
              indicatorIndex: 1,
            ),
            Indicator(
              carouselIndex: carouselIndex,
              indicatorIndex: 2,
            ),
          ],
        ),
      );
  }
}

class CarouselComponent extends StatelessWidget {
  final col1, col2, imgUrl, ttl, txt;

  CarouselComponent({this.col1, this.col2, this.imgUrl, this.ttl, this.txt});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(right: 20),
      color: col2,
      child: Container(
        decoration: BoxDecoration(
          color: col1,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(180),
          ),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 150,
            ),
            Center(
            child: Image.network(imgUrl, height: 100.0),
           ),
            SizedBox(
              height: 20,
            ),
            Text(
              ttl,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.deepPurpleAccent,
                fontWeight: FontWeight.bold,
                fontSize: 36,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                width: 300,
                child: Text(
                  txt,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  final carouselIndex, indicatorIndex;

  Indicator({this.carouselIndex, this.indicatorIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8,
      width: 8,
      margin: EdgeInsets.all(4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: carouselIndex == indicatorIndex ? Colors.black87 : Colors.grey,
      ),
    );
  }
}
