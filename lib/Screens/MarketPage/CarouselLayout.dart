import 'dart:async';

import 'package:cryptodesign/Common/CommonColors.dart';
import 'package:flutter/material.dart';

class CarouselLayout extends StatefulWidget {
  bool? isMount = true;
  CarouselLayout({Key? key, this.isMount}) : super(key: key);

  @override
  State<CarouselLayout> createState() => _CarouselLayoutState();
}

class _CarouselLayoutState extends State<CarouselLayout> {
  PageController _pageController = PageController();

  List images = [
    'https://assets.weforum.org/article/image/f1rGh3mhhk-oj1fj1qjwJ56U37_dJ-MGTGGFHzBp25Q.jpg',
    'https://www.blockchain.com/static/img/home/opengraph.png',
    'https://www.interactivebrokers.com/images/web/cryptocurrency-hero.jpg',
    'https://usa.visa.com/content/dam/VCOM/regional/na/us/Solutions/visa-crypto-opportunities-800x450.jpg',
    'https://images.mktw.net/im-429485?width=700&height=487'
  ];

  int activePage = 0;
  int _currentPage = 0;

  bool isMount = true;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8, initialPage: 0);
    autoPlay();
  }

  @override
  void dispose() {
    super.dispose();
    isMount = false;
  }

  autoPlay() {
    Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (isMount) {
        return setState(() {
          if (_currentPage < (images.length - 1)) {
            _currentPage++;
          } else {
            _currentPage = 0;
          }
          _pageController.animateToPage(
            _currentPage,
            duration: Duration(milliseconds: 350),
            curve: Curves.easeIn,
          );
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 200,
          child: PageView.builder(
              itemCount: images.length,
              pageSnapping: true,
              controller: _pageController,
              onPageChanged: (page) {
                setState(() {
                  activePage = page;
                });
              },
              itemBuilder: (context, pagePosition) {
                bool active = pagePosition == activePage;
                return slider(images, pagePosition, active, context);
              }),
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: indicators(images.length, activePage, context))
      ],
    );
  }
}

AnimatedContainer slider(images, pagePosition, active, context) {
  double margin = active ? 10 : 20;

  return AnimatedContainer(
    duration: Duration(milliseconds: 500),
    curve: Curves.easeInOutCubic,
    margin: EdgeInsets.all(margin),
    decoration: BoxDecoration(
        border: Border.all(color: CommonColors().white(context), width: 5),
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 3.0)],
        image: DecorationImage(
            image: NetworkImage(images[pagePosition]), fit: BoxFit.cover)),
  );
}

List<Widget> indicators(imagesLength, currentIndex, context) {
  return List<Widget>.generate(imagesLength, (index) {
    return Container(
      margin: EdgeInsets.all(3),
      width: 10,
      height: 10,
      decoration: BoxDecoration(
          color: currentIndex == index
              ? CommonColors().black(context)
              : Colors.black26,
          shape: BoxShape.circle),
    );
  });
}
