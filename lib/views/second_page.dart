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
    return BlocListener<HomeBloc, HomeState>(
      listener: (BuildContext context, HomeState state) {
        if (state is HomeSuccess) {
          setState(() {
            imgList.addAll(state.home.banner);
            featuredList.addAll(state.home.featured);
          });
        } else if (state is HomeFail)
          print("banner gagal load");
        else
          print("server masalah");
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
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
slider(imgList),
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                    ),
                    height: 135,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(bottom: 20),
                    child: featured(featuredList))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
