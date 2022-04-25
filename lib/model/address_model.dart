import 'dart:convert';

class Address {
  final String? id;
  final String? address;
  final String? cep;
  final String? complement;
  final String? district;
  final String? city;
  final String? state;

  Address({
    this.id,
    this.address,
    this.cep,
    this.complement,
    this.district,
    this.city,
    this.state,
  });

  Address copyWith({
    String? id,
    String? address,
    String? cep,
    String? complement,
    String? district,
    String? city,
    String? state,
  }) {
    return Address(
      id: id ?? this.id,
      address: address ?? this.address,
      cep: cep ?? this.cep,
      complement: complement ?? this.complement,
      district: district ?? this.district,
      city: city ?? this.city,
      state: state ?? this.state,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'address': address,
      'cep': cep,
      'complement': complement,
      'district': district,
      'city': city,
      'state': state,
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      id: map['id'],
      address: map['address'],
      cep: map['cep'],
      complement: map['complement'],
      district: map['district'],
      city: map['city'],
      state: map['state'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Address.fromJson(String source) =>
      Address.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Address(id: $id, address: $address, cep: $cep, complement: $complement, district: $district, city: $city, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Address &&
        other.id == id &&
        other.address == address &&
        other.cep == cep &&
        other.complement == complement &&
        other.district == district &&
        other.city == city &&
        other.state == state;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        address.hashCode ^
        cep.hashCode ^
        complement.hashCode ^
        district.hashCode ^
        city.hashCode ^
        state.hashCode;
  }
}
