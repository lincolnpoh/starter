import 'package:flutter/material.dart';
import 'fooderlich_theme.dart';

class Card1 extends StatelessWidget {
  const Card1({Key? key}) : super(key: key);

  //only static field can be declared as const in classes...hence "final"
  final String category = 'Recommendation';
  final String title = 'Roll roll roll the Dough';
  final String description = 'Learn to make the perfect & exquisite bread';
  final String chef = 'Lincoln Poh';

  //Every stateless widget comes with a build() method that we must override
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        //Flutter units are specified in pixels
        padding: const EdgeInsets.all(16),
        constraints: const BoxConstraints.expand(
          width: 350,
          height: 450,
        ),
        //"decoration" defines how we draw a shape, in this case, a box
        decoration: const BoxDecoration(
          image: DecorationImage(
            //AssetImage class allows us to specify project assets
            image: AssetImage('assets/mag1.png'),
            //BoxFit.cover tells Flutter to cover the entire box with the image
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        //Stacking texts into the card
        child: Stack(
          children: [
            //For displaying category
            Text(
              category,
              style: FooderlichTheme.darkTextTheme.bodyLarge,
            ),

            //For displaying title
            Positioned(
              top: 20,
              child: Text(
                title,
                style: FooderlichTheme.darkTextTheme.headlineSmall,
              ),
            ),

            //For displaying description
            Positioned(
              bottom: 30,
              right: 0,
              child: Text(
                description,
                style: FooderlichTheme.darkTextTheme.bodyLarge,
              ),
            ),

            //For displaying chef
            Positioned(
              bottom: 10,
              right: 0,
              child: Text(
                chef,
                style: FooderlichTheme.darkTextTheme.bodyLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
