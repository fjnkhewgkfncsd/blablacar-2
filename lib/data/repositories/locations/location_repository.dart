import '../../../model/ride/locations.dart';

abstract class LocationRepository {
  //get all available locations
  List<Location> availableLocations();
}
