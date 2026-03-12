import '../../dummy_data.dart';
import './ride_preference_repository.dart';
import '../../../model/ride_pref/ride_pref.dart';

class RidePreferenceRepositoryMock extends RidePreferenceRepository {
  final List<RidePreference> ridePreferences = fakeRidePrefs;

  @override
  List<RidePreference> getAllRidePreferences() => ridePreferences;

  @override
  void addRidePreference(RidePreference ridePref) {
    ridePreferences.add(ridePref);
  }
}
