import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testcode/blocs/home/home_bloc.dart';
import 'package:testcode/constant.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../models/home.dart';
import '../style.dart';
import 'second_page_part.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final List<BannerHome> imgList = [];
  final List<Featured> featuredList = [];

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
              if (state is HomeSuccess) {
                print("succes");
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      child: topWidget(context),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(5),
                      child: Image.asset(
                        "assets/logo/logo.png",
                      ),
                    ),
                    slider(state.home.banner),
                    Row(
                      children: <Widget>[],
                    ),
                    Container(
                        height: 146,
                        alignment: Alignment.center,
                        child: featured(state.home.featured)),
                  ],
                );
              } else if (state is HomeFail) {
                print("banner gagal load");
                return Container();
              } else {
                print("server masalah");
                return Container();
              }
            }),
          ),
        ),
      ),
    );
  }
}
