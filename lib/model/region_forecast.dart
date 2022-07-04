import '../utils/data_utils.dart';

class RegionForecast {
  final String regionNameThai;
  final String regionNameEnglish;
  final String descriptionThai;
  final String descriptionEnglish;

  const RegionForecast({
    required this.regionNameThai,
    required this.regionNameEnglish,
    required this.descriptionThai,
    required this.descriptionEnglish,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RegionForecast &&
          runtimeType == other.runtimeType &&
          regionNameThai == other.regionNameThai &&
          regionNameEnglish == other.regionNameEnglish &&
          descriptionThai == other.descriptionThai &&
          descriptionEnglish == other.descriptionEnglish);

  @override
  int get hashCode =>
      regionNameThai.hashCode ^
      regionNameEnglish.hashCode ^
      descriptionThai.hashCode ^
      descriptionEnglish.hashCode;

  @override
  String toString() {
    return 'RegionForecast{' +
        ' RegionNameThai: $regionNameThai,' +
        ' RegionNameEnglish: $regionNameEnglish,' +
        ' DescriptionThai: $descriptionThai,' +
        ' DescriptionEnglish: $descriptionEnglish,' +
        '}';
  }

  RegionForecast copyWith({
    String? regionNameThai,
    String? regionNameEnglish,
    String? descriptionThai,
    String? descriptionEnglish,
  }) {
    return RegionForecast(
      regionNameThai: regionNameThai ?? this.regionNameThai,
      regionNameEnglish: regionNameEnglish ?? this.regionNameEnglish,
      descriptionThai: descriptionThai ?? this.descriptionThai,
      descriptionEnglish: descriptionEnglish ?? this.descriptionEnglish,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'RegionNameThai': regionNameThai,
      'RegionNameEnglish': regionNameEnglish,
      'DescriptionThai': descriptionThai,
      'DescriptionEnglish': descriptionEnglish,
    };
  }

  factory RegionForecast.fromMap(Map<String, dynamic> map) {
    String desTh = map['Description'] as String;
    String desEn = map['DescriptionEng'] as String;
    return RegionForecast(
      regionNameThai: map['RegionName'] as String,
      regionNameEnglish: map['RegionNameEng'] as String,
      descriptionThai: replaceDegWithCelsius(desTh),
      descriptionEnglish: replaceDegWithCelsius(desEn),
    );
  }

  factory RegionForecast.fromJson(dynamic json) {
    String desTh = json['Description'] as String;
    String desEn = json['DescriptionEng'] as String;
    return RegionForecast(
      regionNameThai: json['RegionName'] as String,
      regionNameEnglish: json['RegionNameEng'] as String,
      descriptionThai: replaceDegWithCelsius(desTh),
      descriptionEnglish: replaceDegWithCelsius(desEn),
    );
  }
}
