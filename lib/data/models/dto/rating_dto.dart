import 'dart:convert';

class RatingDto {
  double? rate;
  int? count;
  RatingDto({this.rate, this.count});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'rate': rate, 'count': count};
  }

  factory RatingDto.fromMap(Map<String, dynamic> map) {
    return RatingDto(
      rate: map['rate'] != null ? map['rate'] as double : null,
      count: map['count'] != null ? map['count'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RatingDto.fromJson(String source) =>
      RatingDto.fromMap(json.decode(source) as Map<String, dynamic>);
}
