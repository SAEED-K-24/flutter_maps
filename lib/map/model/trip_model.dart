class Trip {
  String? id;
  String? fromCity;
  String? toCity;
  double? fromLat;
  double? fromLong;
  double? toLat;
  double? toLong;
  double? distance;
  double? timeOfTrip;

  Trip({
    this.id,
    this.fromCity,
    this.toCity,
    this.fromLat,
    this.fromLong,
    this.toLat,
    this.toLong,
    this.distance,
    this.timeOfTrip,
  });

  Trip copywith({
    String? id,
    String? fromCity,
    String? toCity,
    double? fromLat,
    double? fromLong,
    double? toLat,
    double? toLong,
    double? distance,
    double? timeOfTrip,
  }) =>
      Trip(
        id: id ?? this.id,
        fromCity: fromCity ?? this.fromCity,
        toCity: toCity ?? this.toCity,
        fromLat: fromLat ?? this.fromLat,
        fromLong: fromLong ?? this.fromLong,
        toLat: toLat ?? this.toLat,
        toLong: toLong ?? this.toLong,
        distance: distance ?? this.distance,
        timeOfTrip: timeOfTrip ?? this.timeOfTrip,
      );
}
