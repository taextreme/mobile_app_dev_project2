import 'package:mobile_app_dev_project2/model/region_forecast.dart';

class DailyForecast {
  final String date;
  final String overallDescriptionThai;
  final String overallDescriptionEnglish;
  final List<RegionForecast> regionsForecast;

  const DailyForecast({
    required this.date,
    required this.overallDescriptionThai,
    required this.overallDescriptionEnglish,
    required this.regionsForecast,
  });

  factory DailyForecast.empty() {
    return const DailyForecast(
        date: "",
        overallDescriptionThai: "",
        overallDescriptionEnglish: "",
        regionsForecast: []);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DailyForecast &&
          runtimeType == other.runtimeType &&
          date == other.date &&
          overallDescriptionThai == other.overallDescriptionThai &&
          overallDescriptionEnglish == other.overallDescriptionEnglish &&
          regionsForecast == other.regionsForecast);

  @override
  int get hashCode =>
      date.hashCode ^
      overallDescriptionThai.hashCode ^
      overallDescriptionEnglish.hashCode ^
      regionsForecast.hashCode;

  @override
  String toString() {
    return 'DailyForecast{' +
        ' date: $date,' +
        ' overallDescriptionThai: $overallDescriptionThai,' +
        ' overallDescriptionEnglish: $overallDescriptionEnglish,' +
        ' regionsForecast: $regionsForecast,' +
        '}';
  }

  DailyForecast copyWith({
    String? date,
    String? overallDescriptionThai,
    String? overallDescriptionEnglish,
    List<RegionForecast>? regionsForecast,
  }) {
    return DailyForecast(
      date: date ?? this.date,
      overallDescriptionThai:
          overallDescriptionThai ?? this.overallDescriptionThai,
      overallDescriptionEnglish:
          overallDescriptionEnglish ?? this.overallDescriptionEnglish,
      regionsForecast: regionsForecast ?? this.regionsForecast,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Date': date,
      'DescTh': overallDescriptionThai,
      'DescEng': overallDescriptionEnglish,
      'RegionsForecast': regionsForecastToMap(),
    };
  }

  List<Map<String, dynamic>> regionsForecastToMap() {
    List<Map<String, dynamic>> result = [];
    for (var element in regionsForecast) {
      result.add(element.toMap());
    }
    return result;
  }

  factory DailyForecast.fromMap(Map<String, dynamic> map) {
    return DailyForecast(
      date: map['Date'] as String,
      overallDescriptionThai: map['DescTh'] as String,
      overallDescriptionEnglish: map['DescEng'] as String,
      regionsForecast: map['RegionsForecast'] as List<RegionForecast>,
    );
  }

  factory DailyForecast.fromJson(dynamic data) {
    List<dynamic> regionsJson = data['RegionsForecast'];
    List<RegionForecast> regions = [];
    for (var element in regionsJson) {
      regions.add(RegionForecast.fromJson(element));
    }
    return DailyForecast(
      date: data['Date'] as String,
      overallDescriptionThai: data['DescTh'] as String,
      overallDescriptionEnglish: data['DescEng'] as String,
      regionsForecast: regions,
    );
  }
}
