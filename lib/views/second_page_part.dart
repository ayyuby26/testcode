import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:testcode/models/home.dart';
import '../style.dart';
import '../constant.dart';

topWidget(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: <Widget>[
      Expanded(
          flex: 1,
          child: Container(
            height: 36,
            margin: EdgeInsets.only(left: 10, top: 10),
            child: TextField(decoration: searchDecor()),
          )),
      topButton(context, TopButtonType.message),
      topButton(context, TopButtonType.notif),
    ],
  );
}

///icon
Widget topButton(BuildContext context, TopButtonType type) {
  String pathIcon;
  type == TopButtonType.message
      ? pathIcon = "assets/icons/notifications.png"
      : pathIcon = "assets/icons/notifications.png";
  return Container(
    margin: EdgeInsets.only(left: 10),
    child: InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: () => Navigator.pushReplacementNamed(context, "/"),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        height: 36,
        width: 36,
        child: Container(
          alignment: Alignment.center,
          child: Stack(
            alignment: Alignment(-2, 1),
            children: <Widget>[
              Image.asset(
                pathIcon,
                height: 36,
              ),
              Container(
                width: 20,
                height: 17,
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: secondaryColor.withOpacity(.7),
                        blurRadius: 7,
                        offset: Offset(0, 5))
                  ],
                ),
                child: Center(
                  child: Text(
                    "15",
                    style: TextStyle(color: primaryColor, fontSize: 11),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

CarouselSlider slider(List<BannerHome> imgList) {
  return CarouselSlider(
    options: CarouselOptions(
      aspectRatio: 1,
      height: 184,
      enlargeCenterPage: false,
    ),
    items: imgList.isEmpty
        ? []
        : imgList
            .map((item) => Container(
                  padding: EdgeInsets.all(10),
                  child: Center(
                    child: Stack(
                      overflow: Overflow.visible,
                      fit: StackFit.passthrough,
                      alignment: Alignment.bottomRight,
                      children: <Widget>[
                        ClipRRect(
                          clipBehavior: Clip.antiAlias,
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            width: 372,
                            height: 184,
                            child: Image.network(
                              item.image,
                              fit: BoxFit.cover,
                              width: 372,
                              height: 184,
                              cacheWidth: 372,
                              cacheHeight: 184,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          height: 40,
                          width: 121,
                          decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(30)),
                          child: Row(
                            children: <Widget>[
                              Container(
                                  margin: EdgeInsets.all(13),
                                  child: Text(
                                    "SEE MORE",
                                    style: TextStyle(
                                        color: backColor, fontSize: 12),
                                  )),
                              Container(
                                alignment: Alignment.center,
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                    color: secondaryColor,
                                    borderRadius: BorderRadius.circular(37)),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: primaryColor,
                                  size: 18,
                                ),
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          right: -80,
                          top: 0,
                          child: Container(
                              constraints: BoxConstraints(maxWidth: 180),
                              child: Text(
                                "For all your summer Jewelry\nneeds",
                                style: TextStyle(fontSize: 21),
                              )),
                        ),
                      ],
                    ),
                  ),
                ))
            .toList(),
  );
}

///featured
featured(featuredList) {
  return ListView.builder(
      shrinkWrap: true,
      itemCount: featuredList.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (_, i) {
        return Container(
          width: 101,
          height: 135,
          decoration: BoxDecoration(
              boxShadow: <BoxShadow>[],
              borderRadius: BorderRadius.circular(80)),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            shadowColor: Colors.blue.withOpacity(.15),
            margin: EdgeInsets.symmetric(horizontal: 11),
            elevation: 10,
            child: Stack(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(10)),
                      child: Image.network(
                        featuredList[i].image,
                        width: 100,
                        height: 85,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(11),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            featuredList[i].name,
                            style: TextStyle(fontSize: 12),
                          ),
                          Text(featuredList[i].price,
                              style: TextStyle(fontSize: 10)),
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                    margin: EdgeInsets.all(5),
                    child: Image.asset("assets/icons/360deg.png")),
              ],
            ),
          ),
        );
      });
}
