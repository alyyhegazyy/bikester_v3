class TripInfo {
  String? startStation;
  String? endStation;
  String? beginTime;
  String? endTime;
  String? tripDuration;
  String? tripCost;

  TripInfo({
    required this.startStation,
    required this.beginTime,
    required this.endStation,
    required this.endTime,
    required this.tripDuration,
    required this.tripCost,
  });
// mapping function from json to model object
  TripInfo.fromJson(Map trip) {
    startStation = trip['startStation'];
    beginTime = trip['startTime'];
    endStation = trip['endStation'];
    endTime = trip['endTime'];
    tripDuration = trip['tripDuration'];
    tripCost = trip['tripCost'];
  }
}
