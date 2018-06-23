import 'package:flutter_app/models/trip_model.dart';

const dummyTrips = const <TripInfo>[
    const TripInfo(
      pickupLocation: 'La Centre',
      destLocation: 'Louis Vuitton',
      driverNote: "This is a simple note. Thank you!",
      date: "4 April 2018",
      time: '3:30Pm',
      payBy: "Cash",
      completed: "Finished",
      className: "Economy"
    ),
     const TripInfo(
      pickupLocation: 'La Centre',
      destLocation: 'Louis Vuitton',
      driverNote: "This is a simple note. Thank you!",
      date: "4 April 2018",
      time: '3:30Pm',
      payBy: "Visa",
      completed: "Cancelled",
      className: "Business"
    ),

     const TripInfo(
      pickupLocation: 'La Centre',
      destLocation: 'Louis Vuitton',
      driverNote: "This is a simple note. Thank you!",
      date: "4 April 2018",
      time: '3:30Pm',
      payBy: "Visa",
      completed: "On Going",
      className: "Business"
    ),
];