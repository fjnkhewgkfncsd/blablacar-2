import 'package:blabla/data/repositories/rides/rides_repository.dart';
import 'package:blabla/model/ride/ride.dart';
import 'package:blabla/states/ride_preference_state.dart';
import 'package:flutter/material.dart';
import '../../../../model/ride_pref/ride_pref.dart';

class RideSelectionViewModel extends ChangeNotifier {
  final RidePreferenceState ridePreferenceState;
  final RidesRepository ridesRepository;

  RideSelectionViewModel({
    required this.ridePreferenceState,
    required this.ridesRepository,
  }) {
    ridePreferenceState.addListener(listener);
  }

  void listener() {
    notifyListeners();
  }

  @override
  void dispose() {
    ridePreferenceState.removeListener(listener);
    super.dispose();
  }

  RidePreference? get selectedRidePreference =>
      ridePreferenceState.ridePreference;

  List<Ride> get matchingRides =>
      ridesRepository.getRidesWithRidePref(selectedRidePreference!);

  void selectPreference(RidePreference? ridePref) {
    if (ridePref != null) {
      ridePreferenceState.selectPreference(ridePref);
    }
  }
}
