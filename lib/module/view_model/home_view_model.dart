import 'package:flutter/material.dart';

import '../model/model_view.dart';
import '../services/home_services.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel() {
    initState();
  }

  ModelView modelView = ModelView(
    name: '',
    gender: '',
    img: '',
    location: '',
  );

  int index = 0;

  final HomeServices _homeServices = HomeServices();

  void generateIntData() {
    notifyListeners();
  }

  Future randomIntData() async {
    List<int> dataInt = [];
    for (var i = 0; i < 300; i++) {
      dataInt.add(i);
    }
    dataInt.shuffle();
    int id = dataInt[0];
    index = id;
    var resp = await _homeServices.getHomeData(id);
    if (resp != null) {
      modelView = ModelView(
        img: resp.image,
        name: resp.name,
        gender: resp.gender,
        location: resp.location.name,
      );
      notifyListeners();
    }
    notifyListeners();
  }

  void initState() {
    generateIntData();
  }
}
