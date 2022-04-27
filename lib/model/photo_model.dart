import 'dart:convert';

class Photo {
  final int? id;
  final String? path;
  final double? latitude;
  final double? longitude;
  final String? description;

  Photo({
    this.id,
    this.path,
    this.latitude,
    this.longitude,
    this.description,
  });

  Photo copyWith({
    int? id,
    String? path,
    double? latitude,
    double? longitude,
    String? description,
  }) {
    return Photo(
      id: id ?? this.id,
      path: path ?? this.path,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'path': path,
      'latitude': latitude,
      'longitude': longitude,
      'description': description,
    };
  }

  factory Photo.fromMap(Map<String, dynamic> map) {
    return Photo(
      id: map['id']?.toInt(),
      path: map['path'],
      latitude: map['latitude']?.toDouble(),
      longitude: map['longitude']?.toDouble(),
      description: map['description'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Photo.fromJson(String source) => Photo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Photo(id: $id, path: $path, latitude: $latitude, longitude: $longitude, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Photo &&
        other.id == id &&
        other.path == path &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        other.description == description;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        path.hashCode ^
        latitude.hashCode ^
        longitude.hashCode ^
        description.hashCode;
  }
}
