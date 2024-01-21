import 'package:flutter/material.dart';
import 'package:mobile_app/helpers/models/request.model.dart';

class RequestProvider with ChangeNotifier {
  List<Request> requests;

  RequestProvider({this.requests = const []});

  void getRequests(List<Request> req) {
    requests = req;

    notifyListeners();
  }
}
