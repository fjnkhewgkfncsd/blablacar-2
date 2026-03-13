import 'package:blabla/data/repositories/locations/location_repository.dart';
import 'package:blabla/model/ride/locations.dart';
import 'package:flutter/material.dart';

class BlaLocationPickerViewModel extends ChangeNotifier {
  final LocationRepository locationRepository;

  BlaLocationPickerViewModel({required this.locationRepository});

  String _currentSearchText = '';
  List<Location> _locations = [];

  String get querySeach => _currentSearchText;
  List<Location> get filteredLocation => _filteredLocation();

  void init(Location? initLocation) {
    _currentSearchText = initLocation?.name ?? '';
    _locations = locationRepository.availableLocations();
    notifyListeners();
  }

  List<Location> _filteredLocation() {
    if (_currentSearchText.length < 2) return [];
    return _locations
        .where(
          (location) =>
              location.name.toLowerCase().contains(_currentSearchText.toLowerCase()),
        )
        .toList();
  }

  void onSearchChanged(String search) {
    _currentSearchText = search;
    notifyListeners();
  }
}
