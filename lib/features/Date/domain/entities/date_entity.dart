import 'package:horario/features/Date/domain/enum/horarios_status_type.dart';

class DateEntity {
  DateEntity({
    this.id,
    required this.name,
    required this.tDated,
    required this.status,
    required this.tel,
  });

  final int? id;
  final DateTime tDated;
  final String name;
  HorarioStatusType status;
  final int? tel;

  @override
  String toString() {
    return 'DateEntity(id: $id,  name: $name, tDated: $tDated, status: $status, telefone: $tel)';
  }
}
