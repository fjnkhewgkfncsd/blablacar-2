import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

import './main_common.dart';
import './data/repositories/locations/location_repository.dart';
import './data/repositories/locations/location_repository_mock.dart';
import './data/repositories/ride_preference/ride_preference_repository_mock.dart';
import './data/repositories/ride_preference/ride_preference_repository.dart';
import './data/repositories/rides/rides_repository.dart';
import './data/repositories/rides/rides_repository_mock.dart';

List<SingleChildWidget> get devProviders {
  return [
    Provider<LocationRepository>(create: (_) => LocationRepositoryMock()),
    Provider<RidePreferenceRepository>(create: (_) => RidePreferenceRepositoryMock()),
    Provider<RidesRepository>(create: (_) => RidesRepositoryMock()),
  ];
}

void main() {
  mainCommon(devProviders);
}
