import 'dart:convert';

import 'package:lampada_frontend/model/address_model.dart';

import 'leader_model.dart';

class Voter {
  final String? id;
  final String? photo;
  final String name;
  final String? surname;
  final String phone;
  final String? cep;
  final String? complement;
  final String? birthday;
  final Address? address;
  final Leader? leader;
  
  Voter({
    this.id,
    this.photo,
    required this.name,
    this.surname,
    required this.phone,
    this.cep,
    this.complement,
    this.birthday,
    this.address,
    this.leader,
  });

  Voter copyWith({
    String? id,
    String? photo,
    String? name,
    String? surname,
    String? phone,
    String? cep,
    String? complement,
    String? birthday,
    Address? address,
    Leader? leader,
  }) {
    return Voter(
      id: id ?? this.id,
      photo: photo ?? this.photo,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      phone: phone ?? this.phone,
      cep: cep ?? this.cep,
      complement: complement ?? this.complement,
      birthday: birthday ?? this.birthday,
      address: address ?? this.address,
      leader: leader ?? this.leader,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'photo': photo,
      'name': name,
      'surname': surname,
      'phone': phone,
      'cep': cep,
      'complement': complement,
      'birthday': birthday,
      'address': address?.toMap(),
      'leader': leader?.toMap(),
    };
  }

  factory Voter.fromMap(Map<String, dynamic> map) {
    return Voter(
      id: map['id'],
      photo: map['photo'],
      name: map['name'] ?? '',
      surname: map['surname'],
      phone: map['phone'] ?? '',
      cep: map['cep'],
      complement: map['complement'],
      birthday: map['birthday'],
      address: map['address'] != null ? Address.fromMap(map['address']) : null,
      leader: map['leader'] != null ? Leader.fromMap(map['leader']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Voter.fromJson(String source) => Voter.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Voter(id: $id, photo: $photo, name: $name, surname: $surname, phone: $phone, cep: $cep, complement: $complement, birthday: $birthday, address: $address, leader: $leader)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Voter &&
        other.id == id &&
        other.photo == photo &&
        other.name == name &&
        other.surname == surname &&
        other.phone == phone &&
        other.cep == cep &&
        other.complement == complement &&
        other.birthday == birthday &&
        other.address == address &&
        other.leader == leader;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        photo.hashCode ^
        name.hashCode ^
        surname.hashCode ^
        phone.hashCode ^
        cep.hashCode ^
        complement.hashCode ^
        birthday.hashCode ^
        address.hashCode ^
        leader.hashCode;
  }
}
