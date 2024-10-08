/*
 * @copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 * @author     : Shiv Charan Panjeta < shiv@toxsl.com >
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of ToXSL Technologies Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 */

import '../../export.dart';

String hourlyFormatter = 'hh:mm a';
String dayFormatter = "yyyy-MM-dd";
String dateMonthFormatter = "dd MMMM yyyy";
String yearDayMonthFormatter = "yyyy/MM/dd";
String dayMonthYearFormatter = "dd/MM/yyyy";
String monthFormatter = "MMM";
String dateFormatter = "dd";
String monthDateYearFormatter = "MMM dd, yyyy";
String yearDayMonthTimeFormatter = "yyyy/MM/dd hh:mm:ss aa";
const constFrontEndDateTimeFormat = 'hh:mm a';

timeFormat(date) {
  return DateFormat(hourlyFormatter).format(date != null ? DateTime.parse(date).toLocal() : DateTime.now());
}

displayRatingTimeFormat(date) {
  return DateFormat(dateMonthFormatter).format(DateTime.parse(date + "Z").toLocal());
}

dayFormat(date) {
  return DateFormat(dayFormatter).format(date != null ? DateTime.parse(date).toLocal() : DateTime.now());
}

yearDayMonthFormat(date) {
  return DateFormat(yearDayMonthFormatter).format(date != null ? DateTime.parse(date).toLocal() : DateTime.now());
}

dayMonthYearFormat(date) {
  return DateFormat(dayMonthYearFormatter).format(date != null ? DateTime.parse(date).toLocal() : DateTime.now());
}

monthDateYearFormat(date) {
  return DateFormat(monthDateYearFormatter).format(date != null ? DateTime.parse(date).toLocal() : DateTime.now());
}

monthFormat(date) {
  return DateFormat(monthFormatter).format(date != null ? DateTime.parse(date).toLocal() : DateTime.now());
}

dateFormat(date) {
  return DateFormat(dateFormatter).format(date != null ? DateTime.parse(date).toLocal() : DateTime.now());
}

yearDayMonthTimeFormat(date) {
  return DateFormat(yearDayMonthTimeFormatter).format(date != null ? DateTime.parse(date).toLocal() : DateTime.now());
}

String convertDateToLocal(String? dateString, {String dateFormat = constFrontEndDateTimeFormat}) {
  try {
    var strToDateTime = DateTime.parse((dateString ?? ''));
    return DateFormat(dateFormat).format(strToDateTime.toLocal());
  } catch (e) {
    debugPrint("Debug Print Error");
    return '';
  }
}

utcToLocalLatest(String date) {
  if(date.trim().isNotEmpty) {
    DateTime dateTime =
    DateFormat("yyyy-MM-ddTHH:mm:ss").parse(date, true).toLocal();

    return dateTime.toString();
  }else{
    return "";
  }}