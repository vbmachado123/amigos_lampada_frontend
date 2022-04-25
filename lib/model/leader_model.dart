import 'dart:convert';

import 'address_model.dart';

class Leader {
  final String? id;
  final String? name;
  final String? phone;
  final String? email;
  final bool? authorized;
  final String? cpf;
  final String? password;
  final String? birthday;
  final Address? address;

  Leader({
    this.id,
    this.name,
    this.phone,
    this.email,
    this.password,
    this.birthday,
    this.address,
    this.authorized,
    this.cpf,
  });

  Leader copyWith({
    String? id,
    String? name,
    String? phone,
    String? email,
    String? password,
    String? birthday,
    Address? address,
  }) {
    return Leader(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      password: password ?? this.password,
      birthday: birthday ?? this.birthday,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'email': email,
      'password': password,
      'birthday': birthday,
      'address': address?.toMap(),
    };
  }

  factory Leader.fromMap(Map<String, dynamic> map) {
    return Leader(
      id: map['id'],
      name: map['name'],
      phone: map['phone'],
      email: map['email'],
      password: map['password'],
      birthday: map['birthday'],
      address: map['address'] != null ? Address.fromMap(map['address']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Leader.fromJson(String source) => Leader.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Leader(id: $id, name: $name, phone: $phone, email: $email, password: $password, birthday: $birthday, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Leader &&
        other.id == id &&
        other.name == name &&
        other.phone == phone &&
        other.email == email &&
        other.password == password &&
        other.birthday == birthday &&
        other.address == address;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        phone.hashCode ^
        email.hashCode ^
        password.hashCode ^
        birthday.hashCode ^
        address.hashCode;
  }
}
