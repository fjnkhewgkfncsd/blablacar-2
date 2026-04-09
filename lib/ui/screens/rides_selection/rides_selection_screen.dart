import 'package:blabla/data/repositories/rides/rides_repository.dart';
import 'package:blabla/ui/states/ride_preference_state.dart';
import 'package:blabla/ui/screens/rides_selection/view_model/ride_selection_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './widgets/ride_selection_content.dart';

///
///  The Ride Selection screen allows user to select a ride, once ride preferences have been defined.
///  The screen also allow user to:
///   -  re-define the ride preferences
///   -  activate some filters.
///
class RidesSelectionScreen extends StatelessWidget {
  const RidesSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final RidesRepository ridesRepo = context.read<RidesRepository>();
    final RidePreferenceState ridePrefState = context
        .read<RidePreferenceState>();
    return ChangeNotifierProvider(
      create : (_) => RideSelectionViewModel(ridePreferenceState: ridePrefState,ridesRepository: ridesRepo),
      builder:(context,child) => RidesSelectionContent(rideSelectionVm: context.read<RideSelectionViewModel>()));
  }
}
