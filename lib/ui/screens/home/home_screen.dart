import 'package:blabla/states/ride_preference_state.dart';
import 'package:blabla/ui/screens/home/view_model/home_view_model.dart';
import 'package:blabla/ui/screens/home/widgets/home_content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewModel? homeViewModel;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (homeViewModel == null) {
      final RidePreferenceState ridePreferenceState = context
          .read<RidePreferenceState>();
      homeViewModel = HomeViewModel(ridePreferenceState: ridePreferenceState);
      homeViewModel!.addListener(onStateChanged);
    }
  }

  void onStateChanged() {
    setState(() => {});
  }

  @override
  void dispose() {
    homeViewModel?.removeListener(onStateChanged);
    homeViewModel?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return HomeContent(homeViewModel: homeViewModel!);
  }
}
