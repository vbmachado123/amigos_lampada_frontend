import 'dart:convert';

class LocaleModel {
  final int? id;
  final double? latitude;
  final double? longitude;
  final String? descricao;

  LocaleModel({
    this.id,
    this.latitude,
    this.longitude,
    this.descricao,
  });

  LocaleModel copyWith({
    int? id,
    double? latitude,
    double? longitude,
    String? descricao,
  }) {
    return LocaleModel(
      id: id ?? this.id,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      descricao: descricao ?? this.descricao,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'latitude': latitude,
      'longitude': longitude,
      'descricao': descricao,
    };
  }

  factory LocaleModel.fromMap(Map<String, dynamic> map) {
    return LocaleModel(
      id: map['id']?.toInt(),
      latitude: map['latitude']?.toDouble(),
      longitude: map['longitude']?.toDouble(),
      descricao: map['descricao'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LocaleModel.fromJson(String source) =>
      LocaleModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'LocaleModel(id: $id, latitude: $latitude, longitude: $longitude, descricao: $descricao)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LocaleModel &&
        other.id == id &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        other.descricao == descricao;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        latitude.hashCode ^
        longitude.hashCode ^
        descricao.hashCode;
  }
}
