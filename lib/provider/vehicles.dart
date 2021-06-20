import 'package:devnology/models/vehicle.dart';
import 'package:flutter/material.dart';
import '../data/dummy_data.dart';

class Vehicles with ChangeNotifier {
  List<Vehicle> _items = DUMMY_VEHICLE;

  List<Vehicle> get items => [..._items];

  void addVehicle(Vehicle vehicle) {
    _items.add(vehicle);
    notifyListeners();
  }
}
