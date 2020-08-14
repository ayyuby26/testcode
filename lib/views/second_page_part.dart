import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
            child: TextField(decoration: searchDecor(),
            ),
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
              height: 184,
              width: 325,
                  padding: EdgeInsets.symmetric(vertical: 5.5,horizontal: 5),
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
                              height: 184,
                              cacheHeight: 184,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.only(left: 11,top: 4, bottom: 4),
                          height: 40,
                          width: 121,
                          decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(30)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Container(
                                  child: Text(
                                    "SEE MORE",
                                    style: TextStyle(
                                        color: backColor, fontSize: 12),
                                  )),
                                  // SizedBox(width: 15),
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
                          right: -65,
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
          height: 121,
          width: 101,
          margin: EdgeInsets.all(5.5),
          decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: placeholderColor.withOpacity(.4), blurRadius: 10)
              ]),
          child: Stack(
            children: <Widget>[
              // pict + icon 360deg
              Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(10)),
                    child: Image.network(
                      featuredList[i].image,
                      width: 101,
                      height: 75,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.all(5),
                      child: Image.asset("assets/icons/360deg.png")),
                ],
              ),
              Positioned(
                left: 10,
                bottom: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      featuredList[i].name,
                      style: TextStyle(fontSize: 12),
                    ),
                    Text(featuredList[i].price, style: TextStyle(fontSize: 10)),
                  ],
                ),
              )
            ],
          ),
        );
      });
}
