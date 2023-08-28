import 'package:flutter_maps_app/map/state/map_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'model/trip_model.dart';


final tripProvider = StateNotifierProvider<TripProvider,Trip>((ref) => TripProvider());