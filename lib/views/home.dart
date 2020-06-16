import 'package:flutter/material.dart';
import 'package:home_rent_app/constants.dart';
import 'package:home_rent_app/models/room.dart';
import 'package:home_rent_app/widgets/popular_place_card.dart';
import 'package:home_rent_app/widgets/recomended_card.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String dropdownBeds = '2-4 Beds';
  String dropdownFilter = 'Short by: Price';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120.0),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text(
                  "My Location",
                  style: kSubtitleStyle.copyWith(height: 2.0),
                ),
                subtitle: Text(
                  "Jakarta, Indonesia",
                  style: kTitleStyle.copyWith(height: 1.5),
                ),
                trailing: Icon(Icons.notifications, color: kBlack),
              ),
              Row(
                children: <Widget>[
                  SizedBox(width: 25.0),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 14.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: DropdownButton(
                      value: dropdownBeds,
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        size: 20.0,
                        color: kBlack.withOpacity(.5),
                      ),
                      underline: Container(),
                      onChanged: (String beds) {
                        setState(() {
                          dropdownBeds = beds;
                        });
                      },
                      items: ["2-4 Beds", "2 Beds", "3 Beds", "4 Beds"]
                          .map(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 14.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: DropdownButton(
                      value: dropdownFilter,
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        size: 20.0,
                        color: kBlack.withOpacity(.5),
                      ),
                      underline: Container(),
                      onChanged: (String beds) {
                        setState(() {
                          dropdownFilter = beds;
                        });
                      },
                      items: [
                        "Short by: Price",
                        "Short by: Name",
                        "Short by: Location",
                        "Short by: Type",
                      ]
                          .map(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 15.0),
              Container(
                width: double.infinity,
                height: 340.0,
                child: ListView.builder(
                  itemCount: roomList.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    var room = roomList[index];
                    return RecommendedCard(room: room);
                  },
                ),
              ),
              SizedBox(height: 15.0),
              ListTile(
                title: Text("Popular Place", style: kTitleStyle),
                trailing: Text("View All", style: kTrailingStyle),
              ),
              ListView.builder(
                itemCount: roomList.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemBuilder: (context, index) {
                  var room = roomList[index];
                  return PopularPlaceCard(room: room);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
