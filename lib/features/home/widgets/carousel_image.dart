import '/constants/global_variables.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselImage extends StatelessWidget {
  const CarouselImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: CarouselSlider(
        items: GlobalVariables.carouselImages.map(
          (i) {
            return Builder(
              builder: (BuildContext context) => Container(
                  decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
// Image.asset(
//                       GlobalVariables.categoryImages[index]['image']!,
//                       fit: BoxFit.cover,
//                       height: 30,
//                       width: 30,
//                     ),
                image: DecorationImage(
                  image: Image.asset(
                    (i),
                    fit: BoxFit.cover,
                  ).image,
                ),
                // image: DecorationImage(
                //     image: NetworkImage(i), fit: BoxFit.cover)
              )),
            );
          },
        ).toList(),
        options: CarouselOptions(
          viewportFraction: 1,
          height: 150,
        ),
      ),
    );
  }
}
