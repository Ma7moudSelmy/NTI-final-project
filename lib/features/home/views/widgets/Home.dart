import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _MyWidgetState();
}

List<String> itmes = [
  "assets/images/Property 1=Default.png",
  "assets/images/Property 1=Variant2.png",
  "assets/images/Property 1=Variant3.png",
];
// List<categorymodel> category = [
//   categorymodel(name: "fouits", image: "assets/images/Frame 402.png"),
//   categorymodel(name: "vegetables", image: "assets/images/Frame 403.png"),
//   categorymodel(name: "dairy", image: "assets/images/image 36.png"),
//   categorymodel(name: "meat", image: "assets/images/image 37.png"),
// ];

class _MyWidgetState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox.shrink(),
        leadingWidth: 0,
        title: Row(
          children: [
            SvgPicture.asset("assets/icons/Vector (1).svg"),
            SizedBox(width: 10),
            Text(
              "61 Hopper street..",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 10),
            Icon(Icons.keyboard_arrow_down_rounded, size: 41),
            Spacer(flex: 1),
            SvgPicture.asset("assets/icons/Vector.svg"),
          ],
        ),
      ),
      body: Column(
        children: [
          CarouselSlider.builder(
            itemCount: itmes.length,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) =>
                    Image.asset(itmes[itemIndex]),
            options: CarouselOptions(
              height: 200,
              aspectRatio: 1,

              viewportFraction: 4,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              enlargeCenterPage: true,
              autoPlayCurve: Curves.linear,
              enableInfiniteScroll: true,

              autoPlayAnimationDuration: Duration(milliseconds: 3),
            ),
          ),
          CarouselSlider.builder(
            itemCount: itmes.length,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) =>
                    Image.asset(itmes[itemIndex]),
            options: CarouselOptions(
              height: 200,
              aspectRatio: 1,

              viewportFraction: 4,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              enlargeCenterPage: true,
              autoPlayCurve: Curves.linear,
              enableInfiniteScroll: true,

              autoPlayAnimationDuration: Duration(milliseconds: 3),
            ),
          ),
        ],
      ),
    );
  }
}
