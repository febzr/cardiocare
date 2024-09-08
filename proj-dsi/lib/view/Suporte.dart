import 'package:cardiocare/components/buttons/back_button.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class suporteslide extends StatelessWidget {
  final List<String> imageUrls = [
    'assets/images/slider/slider_1.png',
    'assets/images/slider/slider 2.png',
    'assets/images/slider/slider 3.png',
    'assets/images/slider/slider 4.png',
    'assets/images/slider/slider 5.png'
  ];

  suporteslide({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Stack(children: [
          Padding(
              padding: EdgeInsets.only(
                  top: (30 / 932) * MediaQuery.of(context).size.height),
              child: const backButton()),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
                margin: EdgeInsets.only(
                    top: (89 / 932) * MediaQuery.of(context).size.height),
                child: Text(
                  'Suporte',
                  style: Theme.of(context).textTheme.titleMedium,
                ))
          ])
        ]),
        CarouselSlider(
          options: CarouselOptions(
            enableInfiniteScroll: false,
            height: (554 / 932) * MediaQuery.of(context).size.height,
            autoPlay: false,
            enlargeCenterPage: true,
          ),
          items: imageUrls.map((url) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 0.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Image.asset(
                    url,
                    fit: BoxFit.fill,
                  ),
                );
              },
            );
          }).toList(),
        ),
        Padding(
          padding: EdgeInsets.only(
              bottom: (20 / 932) * MediaQuery.of(context).size.height),
          child: Image.asset(
            'assets/images/logo_bottom.png',
          ),
        ),
      ],
    )));
  }
}
