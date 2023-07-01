import 'package:flutter/material.dart';
import 'package:flutter_image_slider/carousel.dart';
class imageSlider extends StatefulWidget {
  const imageSlider({Key? key}) : super(key: key);

  @override
  State<imageSlider> createState() => _imageSliderState();
}

class _imageSliderState extends State<imageSlider> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title:  Text('Demo'),
      ),
      body: Container(
        height: size.height * 0.35,
        width: size.width,
        child: Carousel(
          indicatorBarColor: Colors.black.withOpacity(0.2),
          autoScrollDuration: Duration(seconds: 2),
          animationPageDuration: Duration(microseconds: 400),
          activateIndicatorColor: Colors.black,
          animationPageCurve: Curves.bounceInOut,
          indicatorBarHeight: 50,
          indicatorHeight:20 ,
          indicatorWidth: 20,
          unActivatedIndicatorColor: Colors.grey,
          stopAtEnd: true,
          autoScroll: true,
           
          items: [
            Container(
              child: Image.network('https://www.cigna.co.th/sites/default/files/pictures/travel-nature-place-family-1.jpg',fit: BoxFit.cover,),
            ),
            Container(
              child: Image.network('https://www.cigna.co.th/sites/default/files/pictures/travel-nature-place-family-1.jpg',fit: BoxFit.cover,),
            ),
            Container(
              child: Image.network('https://www.cigna.co.th/sites/default/files/pictures/travel-nature-place-family-1.jpg',fit: BoxFit.cover,),
            ),
          ],
        ),
      ),
    );
  }
}
