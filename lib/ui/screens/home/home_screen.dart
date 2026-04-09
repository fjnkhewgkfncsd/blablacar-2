import 'package:blabla/ui/states/ride_preference_state.dart';
import 'package:blabla/ui/screens/home/view_model/home_view_model.dart';
import 'package:blabla/ui/screens/home/widgets/home_content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeViewModel(ridePreferenceState: context.read<RidePreferenceState>()),
      builder:(context,child) =>  HomeContent(homeViewModel: context.read<HomeViewModel>()));
  }
}
