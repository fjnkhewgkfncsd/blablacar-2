import 'package:flutter/material.dart';
import '../model/ride_pref/ride_pref.dart';
import '../data/repositories/ride_preference/ride_preference_repository.dart';

class RidePreferenceState extends ChangeNotifier {
  RidePreferenceRepository ridePreferenceRepository;

  RidePreference? _currentRidePreference;
  final int _maxAllowedSeats = 8;
  List<RidePreference> _historyRidePreference = [];

  int get maxAllowedSeats => _maxAllowedSeats;
  RidePreference? get ridePreference => _currentRidePreference;
  List<RidePreference> get historyRidePreference => _historyRidePreference;

  void init() {
    _historyRidePreference = ridePreferenceRepository.getAllRidePreferences();
    notifyListeners();
  }

  RidePreferenceState({required this.ridePreferenceRepository});

  void selectPreference(RidePreference ridePref) {
    if (_currentRidePreference != ridePref) {
      _currentRidePreference = ridePref;
      ridePreferenceRepository.addRidePreference(ridePref);
    }
    notifyListeners();
  }
}
