import './location_repository.dart';
import '../../../model/ride/locations.dart';
import '../../dummy_data.dart';

class LocationRepositoryMock extends LocationRepository {
  @override
  List<Location> availableLocations() => fakeLocations;
}
