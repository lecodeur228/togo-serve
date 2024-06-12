import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:togoserve/constants.dart';
import 'package:togoserve/models/place.dart';
import 'package:togoserve/services/place_service.dart';
import 'package:togoserve/utils/screen_size.dart';
import 'package:togoserve/utils/text_size.dart';

class PlaceScreen extends StatefulWidget {
  const PlaceScreen({super.key});

  @override
  State<PlaceScreen> createState() => _PlaceScreenState();
}

class _PlaceScreenState extends State<PlaceScreen> {
  bool isLiked = false;
  Future<List>? data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   
  }

  Future loadData() async {
    List getData = await PlaceService.getPlaces();
    if (getData.isNotEmpty) {
      return getData;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: context.heightPercent(1),
            vertical: context.widthPercent(2)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: context.heightPercent(2),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Places",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: context.t3,
                        fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search),
                  ),
                ],
              ),
              SizedBox(
                height: context.height,
                child: FutureBuilder(
                  future: PlaceService.getPlaces(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          Place item = Place(id:  snapshot.data[index]["id"], nom:  snapshot.data[index]["nom"], imageUrl:  snapshot.data[index]["imageUrl"], categorie:  snapshot.data[index]["categorie"], latitude:  snapshot.data[index]["latitude"], longitude:  snapshot.data[index]["longitude"], etoile:  snapshot.data[index]["etoile"], createdAt:  snapshot.data[index]["created_at"], updatedAt:  snapshot.data[index]["updated_at"]);
                          return Container(
                            height: context.heightPercent(30),
                            margin: EdgeInsets.symmetric(
                                vertical: context.heightPercent(1)),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.black87,
                                image: const DecorationImage(
                                    image:
                                        AssetImage("assets/images/image.jpeg"),
                                    fit: BoxFit.cover)),
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: IconButton(
                                        iconSize: context.t3,
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll(Colors
                                                  .white
                                                  .withOpacity(0.5)),
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            isLiked = !isLiked;
                                          });
                                        },
                                        icon: Icon(
                                          Icons.favorite,
                                          color: isLiked
                                              ? Colors.white
                                              : Colors.red,
                                        )),
                                  ),
                                ),
                                const Spacer(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: context.heightPercent(7),
                                      margin: EdgeInsets.all(
                                          context.heightPercent(1)),
                                      padding: EdgeInsets.all(
                                          context.heightPercent(1)),
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.3),
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            item.nom,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: context.p1,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width: context.widthPercent(2),
                                          ),
                                          const Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          Text(
                                            item.etoile,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontSize: context.p1,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    IconButton(
                                        iconSize: context.t3,
                                        style: const ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  Colors.white),
                                        ),
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.place,
                                          color: Constants.primaryColor,
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
