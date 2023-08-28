import 'package:flutter/material.dart';
import 'package:flutter_maps_app/map/pages/search_location_page.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/trip_model.dart';
import '../module.dart';
import '../widgets/custom_button_widget.dart';
import '../widgets/send_request_widget.dart';

class MapPage extends ConsumerWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Trip trip = ref.watch(tripProvider);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            OSMFlutter(
              controller: ref.read(tripProvider.notifier).mapController,
              osmOption: OSMOption(
                zoomOption: const ZoomOption(
                  initZoom: 12,
                  minZoomLevel: 4,
                  maxZoomLevel: 14,
                  stepZoom: 1.0,
                ),
                roadConfiguration: const RoadOption(roadColor: Colors.blueGrey),
                userLocationMarker: UserLocationMaker(
                  personMarker: const MarkerIcon(
                    icon: Icon(
                      Icons.personal_injury,
                      color: Colors.black,
                      size: 48,
                    ),
                  ),
                  directionArrowMarker: const MarkerIcon(
                    icon: Icon(
                      Icons.location_on,
                      color: Colors.black,
                      size: 48,
                    ),
                  ),
                ),
                userTrackingOption: const UserTrackingOption(
                  enableTracking: true,
                  unFollowUser: false,
                ),
                markerOption: MarkerOption(
                    defaultMarker: const MarkerIcon(
                  icon: Icon(
                    Icons.person_pin_circle,
                    color: Colors.blueGrey,
                    size: 48,
                  ),
                )),
              ),
              mapIsLoading: const Center(child: CircularProgressIndicator()),
            ),
            trip.toLat != null
                ? SendRequestWidget(
                    trip: trip,
                  )
                : Positioned(
                    bottom: 20,
                    left: 10,
                    right: 10,
                    child: CustomButtonWidget(
                      title: 'To',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const SeacrhLocationPage();
                            },
                          ),
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
