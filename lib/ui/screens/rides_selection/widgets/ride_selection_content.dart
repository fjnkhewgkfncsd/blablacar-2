import 'package:blabla/ui/screens/rides_selection/view_model/ride_selection_view_model.dart';
import 'package:flutter/material.dart';
import '../../../../model/ride/ride.dart';
import '../../../../model/ride_pref/ride_pref.dart';
import '../../../../utils/animations_util.dart' show AnimationUtils;
import '../../../theme/theme.dart';
import '../widgets/ride_preference_modal.dart';
import '../widgets/rides_selection_header.dart';
import '../widgets/rides_selection_tile.dart';

///
///  The Ride Selection screen allows user to select a ride, once ride preferences have been defined.
///  The screen also allow user to:
///   -  re-define the ride preferences
///   -  activate some filters.
///
class RidesSelectionContent extends StatelessWidget {
  final RideSelectionViewModel rideSelectionVm;
  const RidesSelectionContent({super.key, required this.rideSelectionVm});

  void onBackTap(BuildContext context) {
    Navigator.pop(context);
  }

  void onFilterPressed(){
    //later
  }

  void onRideSelected(Ride ride) {
    // Later
  }

  void onPreferencePressed(BuildContext context) async {
    // 1 - Navigate to the rides preference picker
    RidePreference? newPreference = await Navigator.of(context)
        .push<RidePreference>(
          AnimationUtils.createRightToLeftRoute(
            RidePreferenceModal(initialPreference: rideSelectionVm.selectedRidePreference),
          ),
        );
    rideSelectionVm.selectPreference(newPreference);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: BlaSpacings.m,
          right: BlaSpacings.m,
          top: BlaSpacings.s,
        ),
        child: Column(
          children: [
            RideSelectionHeader(
              ridePreference: rideSelectionVm.selectedRidePreference!,
              onBackPressed: () => onBackTap(context),
              onFilterPressed: onFilterPressed,
              onPreferencePressed:() => onPreferencePressed(context),
            ),

            SizedBox(height: 100),

            Expanded(
              child: ListView.builder(
                itemCount: rideSelectionVm.matchingRides.length,
                itemBuilder: (ctx, index) => RideSelectionTile(
                  ride: rideSelectionVm.matchingRides[index],
                  onPressed: () => onRideSelected(rideSelectionVm.matchingRides[index]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
