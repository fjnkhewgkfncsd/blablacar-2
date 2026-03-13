import 'package:flutter/material.dart';
import '../model/ride_pref/ride_pref.dart';
import '../data/repositories/ride_preference/ride_preference_repository.dart';

class RidePreferenceState extends ChangeNotifier {
  final RidePreferenceRepository _ridePreferenceRepository;

  RidePreference? _currentRidePreference;
  final int _maxAllowedSeats = 8;
  List<RidePreference> _historyRidePreference = [];

  int get maxAllowedSeats => _maxAllowedSeats;
  RidePreference? get ridePreference => _currentRidePreference;
  List<RidePreference> get historyRidePreferences => _historyRidePreference;

  RidePreferenceState({required RidePreferenceRepository ridePrefRepo}) : _ridePreferenceRepository = ridePrefRepo;

  void init() {
    _historyRidePreference = _ridePreferenceRepository.getAllRidePreferences();
    notifyListeners();
  }

  void selectPreference(RidePreference ridePref) {
    if (_currentRidePreference != ridePref) {
      _currentRidePreference = ridePref;
      _ridePreferenceRepository.addRidePreference(ridePref);
      notifyListeners();
    }
  }
}
