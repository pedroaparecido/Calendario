import 'dart:convert';

import 'package:horario/features/Date/domain/entities/date_entity.dart';
import 'package:horario/features/Date/domain/enum/horarios_status_type.dart';

class DateModel extends DateEntity {
  DateModel({
    super.id,
    required super.name,
    required super.tDated,
    required super.status,
    required super.tel,
  });

  factory DateModel.fromMap(Map<String, dynamic> map) {
    HorarioStatusType statusType = HorarioStatusType.cabelo;

    for (var type in HorarioStatusType.values) {
      if (type.name == map['status']) statusType = type;
    }

    return DateModel(
      id: map['id'] == null ? null : map['id'] as int,
      tel: map['telefone'] == null ? null : map['telefone'] as int,
      name: map['name'],
      status: statusType,
      tDated: DateTime.parse(map['teste_data']),
    );
  }

  factory DateModel.fromJson(String source) =>
      DateModel.fromMap(json.decode(source));

  static List<DateModel> fromListMap(dynamic listMap) {
    return List<DateModel>.from(listMap.map((x) => DateModel.fromMap(x)));
  }
}
