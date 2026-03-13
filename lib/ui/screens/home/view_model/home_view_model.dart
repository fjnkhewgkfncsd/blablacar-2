import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:blabla/states/ride_preference_state.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  final RidePreferenceState ridePreferenceState;

  HomeViewModel({required this.ridePreferenceState}) {
    ridePreferenceState.addListener(onRidePreferenceStateChanged);
  }

  RidePreference? get currentRidePreference =>
      ridePreferenceState.ridePreference;
  List<RidePreference> get historyRidePreferences =>
      ridePreferenceState.historyRidePreferences;
      
  void onRidePreferenceStateChanged() {
    notifyListeners();
  }

  @override
  void dispose() {
    ridePreferenceState.removeListener(onRidePreferenceStateChanged);
    super.dispose();
  }

  void onRidePreferenceSelected(RidePreference ridePreference) {
    ridePreferenceState.selectPreference(ridePreference);
  }
}
