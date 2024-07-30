import '../../domain/entities/dates_entity.dart';

class DatesModel extends DatesEntity {
  DatesModel({
    required super.maximum,
    required super.minimum,
  });

  factory DatesModel.fromJson(Map<String, dynamic> json) => DatesModel(
        maximum:
            json["maximum"] ? DateTime.now() : DateTime.parse(json["maximum"]),
        minimum:
            json["minimum"] ? DateTime.now() : DateTime.parse(json["minimum"]),
      );

  Map<String, dynamic> toJson() => {
        "maximum":
            "${maximum.year.toString().padLeft(4, '0')}-${maximum.month.toString().padLeft(2, '0')}-${maximum.day.toString().padLeft(2, '0')}",
        "minimum":
            "${minimum.year.toString().padLeft(4, '0')}-${minimum.month.toString().padLeft(2, '0')}-${minimum.day.toString().padLeft(2, '0')}",
      };
}
