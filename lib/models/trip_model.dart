class TripInfo {
  const TripInfo(
      {this.assetName,
      this.location,
      this.name,
      this.completed,
      this.payBy,
      this.amount,
      this.bookingId,
      this.className,
      this.pickupLocation,
      this.destLocation,
      this.time,
      this.date,
      this.driverNote,
      this.userRating});

  final String assetName;
  final String location;
  final String name;
  final String completed;
  final String payBy;
  final double amount;
  final String bookingId;
  final String className;
  final String time;
  final String date;
  final String pickupLocation, destLocation;
  final String driverNote;
  final String userRating;

  bool get isValid => assetName != null && location != null;
}


List<TripInfo> dummyData = [
  new TripInfo(
    location: "Le Centre",
    destLocation: "Louis Vuitton Foundation",
    time: "3.20Pm",
    completed: "Finished",
    date: "10 April 2018",
    payBy: "Cash",
    className: "Economy",
      
      assetName: "http://www.usanetwork.com/sites/usanetwork/files/styles/629x720/public/suits_cast_harvey.jpg?itok=fpTOeeBb"),

  new TripInfo(
    location: "Le Centre",
    destLocation: "Louis Vuitton Foundation",
    time: "3.20Pm",
    completed: "Finished",
    date: "10 April 2018",
    payBy: "Cash",
    className: "Economy",
      
      assetName: "http://www.usanetwork.com/sites/usanetwork/files/styles/629x720/public/suits_cast_harvey.jpg?itok=fpTOeeBb"),

];
