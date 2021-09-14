import 'dart:convert';

class Cryto {
  final String name;
  final int value;
  Cryto({
    required this.name,
    required this.value,
  });

  Cryto copyWith({
    String? name,
    int? value,
  }) {
    return Cryto(
      name: name ?? this.name,
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'value': value,
    };
  }

  factory Cryto.fromMap(Map<String, dynamic> map) {
    return Cryto(
      name: map['name'],
      value: map['value']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Cryto.fromJson(String source) => Cryto.fromMap(json.decode(source));

  @override
  String toString() => 'Cryto(name: $name, value: $value)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Cryto &&
      other.name == name &&
      other.value == value;
  }

  @override
  int get hashCode => name.hashCode ^ value.hashCode;
}