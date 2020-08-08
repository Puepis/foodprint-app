import 'package:dartz/dartz.dart';
import 'package:foodprint/domain/core/value_objects.dart';
import 'package:foodprint/domain/foodprint/foodprint_entity.dart';
import 'package:foodprint/domain/photos/photo_entity.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';

List<Tuple2<PhotoEntity, RestaurantEntity>> getPhotoAssocFromFoodprint(
    FoodprintEntity foodprint) {
  final restaurantPhotos = foodprint.restaurantPhotos;
  final List<Tuple2<PhotoEntity, RestaurantEntity>> result = [];
  restaurantPhotos.forEach((restaurant, photos) {
    for (final photo in photos) {
      result.add(Tuple2(photo, restaurant));
    }
  });
  return result;
}

extension TimestampParser on Timestamp {
  static const months = {
    "01": "Jan.",
    "02": "Feb.",
    "03": "March",
    "04": "April",
    "05": "May",
    "06": "June",
    "07": "July",
    "08": "Aug.",
    "09": "Sept.",
    "10": "Oct.",
    "11": "Nov.",
    "12": "Dec."
  };

  String toReadable() {
    final String value = this.getOrCrash();
    final String date = _dateToReadable(value.substring(0, 10));
    final String time = _timeToReadable(value.substring(11, 19));

    return "$date $time";
  }

  String _dateToReadable(String date) {
    final String day = date.substring(8, 10);
    final String year = date.substring(0, 4);
    final String month = months[date.substring(5, 7)];
    final String stringDay = day.compareTo("10") < 0 ? day[1] : day;
    return "$month $stringDay, $year";
  }

  String _timeToReadable(String time) {
    final String hour = time.substring(0, 2);
    final String minute = time.substring(3, 5);
    String hourString = hour;
    String amOrPm = "am";
    if (hour.compareTo("12") > 0) {
      hourString = (int.parse(hour) - 12).toString();
      amOrPm = "pm";
    } else if (hour.compareTo("10") < 0) {
      if (double.parse(hour[1]) == 0) {
        hourString = "12";
      } else {
        hourString = hour[1];
      }
    }
    return "$hourString:$minute $amOrPm";
  }
}
