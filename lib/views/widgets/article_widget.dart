


import 'package:flutter/material.dart';
import 'package:togoserve/utils/screen_size.dart';
import 'package:togoserve/utils/text_size.dart';

class ArticleWidget extends StatelessWidget {
  const ArticleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(context.heightPercent(1)),
      width: context.widthPercent(45),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 3),
          )
        ],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12)),
              child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(
                    "assets/images/image.jpeg",
                  ),
                  fit: BoxFit.cover,
                )),
                height: context.heightPercent(20),
                width: double.infinity,
              )),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: context.widthPercent(2)),
            child: Text(
              "Head phone",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: context.t4,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: context.widthPercent(2)),
            child: Text(
              "25000 XOF",
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: context.p1,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
