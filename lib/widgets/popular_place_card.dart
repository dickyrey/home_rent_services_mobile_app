import 'package:flutter/material.dart';
import '../helpers/colors.dart';
import '../models/room.dart';


class PopularPlaceCard extends StatelessWidget {
  final Room room;
  PopularPlaceCard({this.room});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 90.0,
      margin: EdgeInsets.symmetric(horizontal: 18.0, vertical: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 90.0,
            height: 90.0,
            margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 0.0,
                  left: 0.0,
                  right: 12.0,
                  bottom: 12.0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.asset(
                      room.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  right: 0.0,
                  bottom: 0.0,
                  child: Card(
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    color: kBlueColor,

                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 2.0,
                      ),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.star,
                            size: 10.0,
                            color: kBackgroundLightColor,
                          ),
                          SizedBox(width: 3.0),
                          Text(room.rating,
                              style: theme.textTheme.headline5
                                  .copyWith(color: kPrimaryDarkColor))
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(room.name,
                      style: theme.textTheme.headline3, maxLines: 1),
                  Text(room.place, style: theme.textTheme.subtitle2),
                  Row(
                    children: <Widget>[
                      Text("${room.width}ft | ${room.height}ft",
                          maxLines: 1, style: theme.textTheme.subtitle1),
                      Spacer(),
                      Text(
                        "\$ ${room.price}.00",
                        style: theme.textTheme.headline3.copyWith(color: kBlueColor),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
