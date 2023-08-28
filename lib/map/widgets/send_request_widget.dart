import 'package:flutter/material.dart';
import 'package:flutter_maps_app/map/widgets/custom_button_widget.dart';

import '../model/trip_model.dart';

class SendRequestWidget extends StatelessWidget {
  const SendRequestWidget({super.key, required this.trip, this.onTap});

  final Trip trip;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      left: 10,
      right: 10,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(16),
        ),
        // height: 40.h,
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: 'time of trip:',
                style: const TextStyle(fontSize: 18),
                children: <TextSpan>[
                  TextSpan(
                      text: ' ${trip.timeOfTrip} mints',
                      style: const TextStyle(color: Colors.grey, fontSize: 13)),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            RichText(
              text: TextSpan(
                text: 'distance:',
                style: const TextStyle(fontSize: 18),
                children: <TextSpan>[
                  TextSpan(
                      text: ' ${trip.distance} km',
                      style: const TextStyle(color: Colors.grey, fontSize: 13)),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            RichText(
              text: TextSpan(
                text: 'from:',
                style: const TextStyle(fontSize: 18),
                children: <TextSpan>[
                  TextSpan(
                      text: ' ${trip.fromCity}',
                      style: const TextStyle(color: Colors.grey, fontSize: 13)),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            RichText(
              text: TextSpan(
                text: 'to:',
                style: const TextStyle(fontSize: 18),
                children: <TextSpan>[
                  TextSpan(
                      text: ' ${trip.toCity}',
                      style: const TextStyle(color: Colors.grey, fontSize: 13)),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
                child: CustomButtonWidget(
              title: 'Next',
              onTap: onTap,
            )),
          ],
        ),
      ),
    );
  }
}
