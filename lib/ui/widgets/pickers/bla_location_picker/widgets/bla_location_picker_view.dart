import 'package:blabla/model/ride/locations.dart';
import 'package:blabla/ui/theme/theme.dart';
import 'package:blabla/ui/widgets/pickers/bla_location_picker/view_model/bla_location_picker_view_model.dart';
import 'package:blabla/ui/widgets/pickers/bla_location_picker/widgets/bla_location_search_bar.dart';
import 'package:blabla/ui/widgets/pickers/bla_location_picker/widgets/bla_location_tite.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class BlaLocationPickerView extends StatefulWidget {
  
  const BlaLocationPickerView({super.key});

  @override
  State<BlaLocationPickerView> createState() => _BlaLocationPickerViewState();
}

class _BlaLocationPickerViewState extends State<BlaLocationPickerView> {
  void onTap(Location location) {
    Navigator.pop<Location>(context, location);
  }

  void onBackTap() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final BlaLocationPickerViewModel locationViewModel = context.watch<BlaLocationPickerViewModel>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: BlaSpacings.m,
          right: BlaSpacings.m,
          top: BlaSpacings.s,
        ),
        child: Column(
          children: [
            LocationSearchBar(
              initSearch: locationViewModel.querySeach,
              onBackTap: () => Navigator.pop(context),
              onSearchChanged: locationViewModel.onSearchChanged,
            ),

            SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: locationViewModel.filteredLocation.length,
                itemBuilder: (context, index) => LocationTile(
                  location: locationViewModel.filteredLocation[index],
                  onTap: onTap,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
