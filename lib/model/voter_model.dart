import 'dart:convert';

class Voter {
  final String? photo;
  final String name;
  final String? surname;
  final String phone;
  final String? cep;
  final String? complement;
  final String? birthday;

  Voter({
    this.photo,
    required this.name,
    this.surname,
    required this.phone,
    this.cep,
    this.complement,
    this.birthday,
  });

  Voter copyWith({
    String? photo,
    String? name,
    String? surname,
    String? phone,
    String? cep,
    String? complement,
    String? birthday,
  }) {
    return Voter(
      photo: photo ?? this.photo,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      phone: phone ?? this.phone,
      cep: cep ?? this.cep,
      complement: complement ?? this.complement,
      birthday: birthday ?? this.birthday,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'photo': photo,
      'name': name,
      'surname': surname,
      'phone': phone,
      'cep': cep,
      'complement': complement,
      'birthday': birthday,
    };
  }

  factory Voter.fromMap(Map<String, dynamic> map) {
    return Voter(
      photo: map['photo'],
      name: map['name'] ?? '',
      surname: map['surname'],
      phone: map['phone'] ?? '',
      cep: map['cep'],
      complement: map['complement'],
      birthday: map['birthday'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Voter.fromJson(String source) => Voter.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Voter(photo: $photo, name: $name, surname: $surname, phone: $phone, cep: $cep, complement: $complement, birthday: $birthday)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Voter &&
        other.photo == photo &&
        other.name == name &&
        other.surname == surname &&
        other.phone == phone &&
        other.cep == cep &&
        other.complement == complement &&
        other.birthday == birthday;
  }

  @override
  int get hashCode {
    return photo.hashCode ^
        name.hashCode ^
        surname.hashCode ^
        phone.hashCode ^
        cep.hashCode ^
        complement.hashCode ^
        birthday.hashCode;
  }
}
