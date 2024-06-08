

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:togoserve/utils/screen_size.dart';
import 'package:togoserve/utils/text_size.dart';

class PlaceWidget extends StatefulWidget {
  bool isLiked = false;
   PlaceWidget({super.key,required isLiked});

  @override
  State<PlaceWidget> createState() => _PlaceWidgetState();
}

class _PlaceWidgetState extends State<PlaceWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
                      margin: EdgeInsets.all(context.heightPercent(1)),
                      width: context.widthPercent(55),
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
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: IconButton(
                                      iconSize: context.t3,
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.white.withOpacity(0.5)),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          widget.isLiked = !widget.isLiked;
                                        });
                                      },
                                      icon: Icon(
                                        Icons.favorite,
                                        color:
                                            widget.isLiked ? Colors.white : Colors.red,
                                      )),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: context.heightPercent(1),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: context.widthPercent(2)),
                            child: Row(
                              children: [
                                Text(
                                  "Hotel 2 février",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: context.t4,
                                  ),
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                Text(
                                  "4.0",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: context.p1,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: context.widthPercent(2)),
                            child: const Text(
                              "Agoè Assiyéyé post, 85331 street avenu",
                            ),
                          )
                        ],
                      ),
                    );
                  
  }
}