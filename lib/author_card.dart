import 'package:flutter/material.dart';
import 'fooderlich_theme.dart';
import 'circle_image.dart';

class AuthorCard extends StatefulWidget {
  //class constructor should be at the top before any class members declaration
  const AuthorCard({
    Key? key,
    required this.authorName,
    required this.title,
    this.imageProvider,
  }) : super(key: key);

  //class members
  final String authorName;
  final String title;
  final ImageProvider? imageProvider;

  //overriding createState() method is part of the abstract requirement when working with StatefulWidget, whereas for StatelessWidget, it's not required.
  //Take note that overriding the build() method is a MUST, because it allows us to track the element within the element tree.
  @override
  State<AuthorCard> createState() => _AuthorCardState();
}

class _AuthorCardState extends State<AuthorCard> {
  bool favouriteBtnFlg = false;
  String favouriteBtnTxt = '';
  Icon favouriteIcon = const Icon(Icons.favorite_border_outlined);
  Color? favouriteIconColor = Colors.grey[400];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleImage(
                //by calling the class property "widget.", we are able to retrieve the class member variable for AuthorCard's imageProvider
                imageProvider: widget.imageProvider,
                imageRadius: 28,
              ),
              const SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    //by calling the class property "widget.", we are able to retrieve the class member variable for AuthorCard's authorName
                    widget.authorName,
                    style: FooderlichTheme.lightTextTheme.displayMedium,
                  ),
                  Text(
                    //by calling the class property "widget.", we are able to retrieve the class member variable for AuthorCard's title
                    widget.title,
                    style: FooderlichTheme.lightTextTheme.displaySmall,
                  ),
                ],
              ),
            ],
          ),
          IconButton(
            icon: favouriteIcon,
            iconSize: 30,
            color: favouriteIconColor,
            onPressed: () {
              //setState must be used in order to notify the framework that the internal state of this widget has been changed
              //This will cause flutter to execute the build() method, which reflect the new state (aka, changes to the UI)
              setState(() {
                favouriteBtnFlg = !favouriteBtnFlg;
              });

              if (favouriteBtnFlg) {
                favouriteBtnTxt = 'Favorite has been set';
                favouriteIcon = const Icon(Icons.favorite);
                favouriteIconColor = Colors.red;
              } else {
                favouriteBtnTxt = 'Favorite has been unset';
                favouriteIcon = const Icon(Icons.favorite_border_outlined);
                favouriteIconColor = Colors.grey[400];
              }
              final snackBar = SnackBar(content: Text(favouriteBtnTxt));

              //forcing the current snackBar to enter exit animation before showing again.
              //This is to prevent those user from spamming and bugging the favourite animation
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
          ),
        ],
      ),
    );
  }
}

/*
//Leaving a trace here to show how a StatelessWidget could be transformed and turned into a Stateful widget above
class AuthorCard extends StatelessWidget {
  //class constructor should be at the top before any class members declaration
  const AuthorCard({
    Key? key,
    required this.authorName,
    required this.title,
    this.imageProvider,
  }) : super(key: key);

  //class members
  final String authorName;
  final String title;
  final ImageProvider? imageProvider;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleImage(
                imageProvider: imageProvider,
                imageRadius: 28,
              ),
              const SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    authorName,
                    style: FooderlichTheme.lightTextTheme.displayMedium,
                  ),
                  Text(
                    title,
                    style: FooderlichTheme.lightTextTheme.displaySmall,
                  ),
                ],
              ),
            ],
          ),
          IconButton(
            onPressed: () {
              const snackBar = SnackBar(content: Text('Favorite has been set'));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            icon: const Icon(Icons.favorite_border),
            iconSize: 30,
            color: Colors.grey[400],
          ),
        ],
      ),
    );
  }
}
*/
