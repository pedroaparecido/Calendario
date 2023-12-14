import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horario/features/Date/domain/entities/date_entity.dart';
import 'package:horario/features/Date/domain/enum/horarios_status_type.dart';
import 'package:horario/features/Date/domain/repositories/date_repository.dart';
import 'package:horario/service_locator.dart';

class DateController extends GetxController {
  final dateEntity = <DateEntity>[].obs;
  final _dateRepository = sl<DateRepository>();
  final nameInputController = TextEditingController();
  final telInputController = TextEditingController();
  final idInputController = TextEditingController();
  final tdatedInputController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void onInit() async {
    await getAllDate();
    super.onInit();
  }

  void _resetForm() {
    formKey.currentState!.reset();
  }

  Future<void> addDate(DateEntity date) async {
    final res = await _dateRepository.insert(date: date);
    res.fold(
      (l) => print(l),
      (r) {
        dateEntity.add(r);
        _resetForm();
        Get.back();
      },
    );
  }

  Future<void> updateDate(DateEntity date) async {
    final res = await _dateRepository.update(date: date);
    res.fold(
      (l) => print(l),
      (r) {
        dateEntity.removeWhere((element) => element.id == r.id);
        dateEntity.add(r);
        dateEntity.assignAll(dateEntity);
        dateEntity.sort((a, b) => b.id!.compareTo(a.id!));
        _resetForm();
        Get.back();
      },
    );
  }

  Future<void> getAllDate() async {
    final res = await _dateRepository.getAll();
    res.fold(
      (l) => print(l),
      (r) => dateEntity.assignAll(r),
    );
  }

  Future<void> validFormI() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      await addDate(
        DateEntity(
          tel: int.parse(telInputController.text),
          status: HorarioStatusType.cabelo,
          name: nameInputController.text,
          tDated: DateTime.parse(tdatedInputController.text)),
      );
    }
  }

  Future<void> validFormU() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      await updateDate(
        DateEntity(
            tel: int.parse(telInputController.text),
            status: HorarioStatusType.cabelo,
            name: nameInputController.text,
            tDated: DateTime.parse(tdatedInputController.text)),
      );
    }
  }

  Future<void> updateProduct(DateEntity date) async {
    //isLoading.value = true;
    final res = await _dateRepository.update(date: date);
    res.fold(
        (l) => Get.defaultDialog(
            title: 'Erro!',
            middleText: 'Operação não executada!',
            backgroundColor: Colors.white,
            confirm:
                ElevatedButton(onPressed: Get.back, child: const Text('OK!'))),
        (r) {
        dateEntity.removeWhere((element) => element.id == r.id);
        dateEntity.add(r);
        dateEntity.assignAll(dateEntity);
        dateEntity.sort((a, b) => b.id!.compareTo(a.id!));
        _resetForm();
        Get.back();
      },
    );
    //isLoading.value = false;
  }

  Future<void> deleteDate(int id) async {
    //isLoading.value = true;
    final res = await _dateRepository.delete(id);

    if (res) {
      //isLoading.value = false;
      dateEntity.removeWhere((element) => element.id == id);
      Get.defaultDialog(
          title: 'Confirmar',
          middleText: 'Operação executada!',
          backgroundColor: Colors.white,
          confirm:
              ElevatedButton(onPressed: Get.back, child: const Text('OK!')));
    } else {
      //isLoading.value = false;
      Get.defaultDialog(
          title: 'Erro!',
          middleText: 'Operação não executada!',
          backgroundColor: Colors.white,
          confirm:
              ElevatedButton(onPressed: Get.back, child: const Text('OK!')));
    }
  }
}
