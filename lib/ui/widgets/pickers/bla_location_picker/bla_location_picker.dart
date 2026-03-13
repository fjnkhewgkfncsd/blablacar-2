import 'package:blabla/data/repositories/locations/location_repository.dart';
import 'package:blabla/ui/widgets/pickers/bla_location_picker/view_model/bla_location_picker_view_model.dart';
import 'package:blabla/ui/widgets/pickers/bla_location_picker/widgets/bla_location_picker_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../model/ride/locations.dart';

///
/// A  Location Picker is a view to pick a Location:
///
class BlaLocationPicker extends StatelessWidget {
  final Location? initLocation;
  const BlaLocationPicker({super.key,required this.initLocation });
  @override
  Widget build(BuildContext context) {
    final LocationRepository locationRepository = context
        .read<LocationRepository>();
    return ChangeNotifierProvider(
      create: (_) =>
          BlaLocationPickerViewModel(locationRepository: locationRepository)..init(initLocation),
      child: BlaLocationPickerView(),
    );
  }
}
