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
class RidesSelectionScreen extends StatefulWidget {
  const RidesSelectionScreen({super.key});

  @override
  State<RidesSelectionScreen> createState() => _RidesSelectionScreenState();
}

class _RidesSelectionScreenState extends State<RidesSelectionScreen> {
  RideSelectionViewModel? rideSelectionVM;

  void listener() {
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (rideSelectionVM == null) {
      final RidesRepository ridesRepo = context.read<RidesRepository>();
      final RidePreferenceState ridePrefState = context
          .read<RidePreferenceState>();
      rideSelectionVM = RideSelectionViewModel(
        ridePreferenceState: ridePrefState,
        ridesRepository: ridesRepo,
      );
      rideSelectionVM!.addListener(listener);
    }
  }

  @override
  void dispose() {
    rideSelectionVM!.removeListener(listener);
    rideSelectionVM!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RidesSelectionContent(rideSelectionVm: rideSelectionVM!);
  }
}
