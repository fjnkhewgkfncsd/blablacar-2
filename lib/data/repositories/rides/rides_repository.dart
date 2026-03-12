import '../../../model/ride/ride.dart';
import '../../../model/ride_pref/ride_pref.dart';

abstract class RidesRepository {

  List<Ride> getRides();

  List<Ride> getRidesWithRidePref(RidePreference ridePref);
}
