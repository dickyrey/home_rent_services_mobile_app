import 'package:flutter/material.dart';
import '../helpers/colors.dart';
import '../models/room.dart';

class RecommendedCard extends StatelessWidget {
  final Room room;
  RecommendedCard({this.room});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      margin: EdgeInsets.only(left: 18.0, bottom: 8.0),
      elevation: 0.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(25.0),
            child: Image.asset(
              room.image,
              fit: BoxFit.cover,
              width: 200.0,
              height: 180.0,
            ),
          ),
          Container(
            width: 160.0,
            height: 130.0,
            padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  room.name,
                  maxLines: 2,
                  style: theme.textTheme.headline4,
                ),
                SizedBox(height: 8.0),
                Text(
                  room.place,
                  maxLines: 2,
                  style: theme.textTheme.subtitle2,
                ),
                Spacer(),
                Row(
                  children: <Widget>[
                    Text(
                      "\$ ${room.price}.00",
                      style:
                          theme.textTheme.headline3.copyWith(color: kBlueColor),
                    ),
                    Spacer(),
                    Container(
                      width: 35.0,
                      height: 35.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [
                            kErrorDarkColor,
                            kErrorLightColor,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: theme.errorColor.withOpacity(.7),
                            blurRadius: 15.0,
                            spreadRadius: 0.2,
                            offset: Offset(0, 8),
                          )
                        ],
                      ),
                      child: Icon(
                        Icons.bookmark,
                        color: kBackgroundLightColor,
                        size: 20.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
