import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobile_app_dev_project2/model/daily_forecast.dart';

class FirestoreService {
  final forecastRef = FirebaseFirestore.instance
      .collection('forecasts')
      .withConverter<DailyForecast>(
          fromFirestore: (snapshot, _) =>
              DailyForecast.fromMap(snapshot.data()!),
          toFirestore: (dailyForecast, _) => dailyForecast.toMap());

  Future<void> setDailyForecast(String docName, forecast) async {
    await forecastRef.doc(docName).set(forecast);
  }

  Future<DailyForecast> getDailyForecast(String docName) async {
    DailyForecast forecast = await forecastRef
        .doc(docName)
        .get()
        .then((snapshot) => snapshot.data()!);

    return forecast;
  }
}
