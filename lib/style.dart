import 'package:flutter/material.dart';
import 'package:testcode/constant.dart';

/// using param String "u" for Username TextField , Empty String "" for Password TextField
loginDecor(String type) {
  return InputDecoration(
    labelText: type == "u" ? "Username" : "Password",
    labelStyle: TextStyle(color: secondaryColor),
    contentPadding: EdgeInsets.only(left: 10),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide.none, borderRadius: BorderRadius.circular(7)),
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.all(Radius.circular(7)),
    ),
    fillColor: secondaryColor.withOpacity(.1),
    filled: true,
  );
}

///search
InputDecoration searchDecor() {
  return InputDecoration(
    hintText: "Search for anything on Shoplink",
    hintStyle: TextStyle(color: placeholderColor),
    prefixIcon: Icon(
      Icons.search,
      size: 18,
      color: placeholderColor,
    ),
    contentPadding: EdgeInsets.zero,
    filled: true,
    fillColor: backColor.withOpacity(.1),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide.none, borderRadius: BorderRadius.circular(60)),
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.all(Radius.circular(60)),
    ),
  );
}
