import "dart:convert";

import "package:http/http.dart" as http;
import "package:togoserve/models/place.dart";

class PlaceService {
  static Future getPlaces() async {
    List<Place> placeList = [];
    var reponse =
        await http.get(Uri.parse("http://togodata.eshapshop.com/api/places/"));

    if (reponse.statusCode == 200) {
      final data = jsonDecode(reponse.body);
      if (data["status"] == "SUCCESS") {
        return data["places"];
      }
    }
  }
}
