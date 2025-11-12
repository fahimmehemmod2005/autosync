import 'package:get/get.dart';
import 'package:autosync/widgets/NotificationCard.dart';

class NotificationController extends GetxController {
  var notifications = <NotificationModel>[
    NotificationModel(
      title: "Reminder: Your service is tomorrow at 10:00 AM",
      time: "5 minutes ago",
      isRecent: true,
    ),
    NotificationModel(
      title: "It’s almost time! Your tire change appointment is in 2 hours",
      time: "5 minutes ago",
      isRecent: true,
    ),
    NotificationModel(
      title: "Limited-time offer! Get 10% off your next service",
      time: "1 hour ago",
    ),
    NotificationModel(
      title: "Flash Sale: Save up to 20% on oil changes, book now!",
      time: "1 hour ago",
    ),
    NotificationModel(
      title: "Your pre-ordered car is now ready for pickup!",
      time: "1 hour ago",
    ),
    NotificationModel(
      title: "We’ve received your order! It’s processing and will be ready soon",
      time: "1 hour ago",
    ),
    NotificationModel(
      title:
          "New version of the app is available! Update now to enjoy new features",
      time: "1 hour ago",
    ),
  ].obs;
}
