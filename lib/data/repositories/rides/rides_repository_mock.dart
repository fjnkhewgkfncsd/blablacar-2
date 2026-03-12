import '../../../model/ride/ride.dart';
import '../../dummy_data.dart';
import './rides_repository.dart';
import '../../../model/ride_pref/ride_pref.dart';
import '../../../utils/date_time_utils.dart';

class RidesRepositoryMock extends RidesRepository {
  List<Ride> allRides = fakeRides;
  @override
  List<Ride> getRides() => allRides;

  @override
  List<Ride> getRidesWithRidePref(RidePreference ridePref) {
    return allRides
        .where(
          (ride) =>
              ridePref.arrival == ride.arrivalLocation &&
              ridePref.departure == ride.departureLocation &&
              ridePref.requestedSeats <= ride.availableSeats &&
              DateTimeUtils.compareDate(ride.departureDate),
        )
        .toList();
  }
}
