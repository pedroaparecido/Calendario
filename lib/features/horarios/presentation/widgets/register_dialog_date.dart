import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horario/features/Date/domain/entities/date_entity.dart';
import 'package:horario/features/Date/presentation/controller/date_controller.dart';
import 'package:intl/intl.dart';

class DateRegisterWidget extends StatelessWidget {
  DateRegisterWidget({required this.dateEntity, super.key});

  final _dateController = Get.find<DateController>();
  final format = DateFormat("yyyy-MM-dd HH:mm");
  final DateEntity dateEntity;

  @override
  Widget build(BuildContext context) {
    _dateController.telInputController.text = dateEntity.tel.toString();
    _dateController.nameInputController.text = dateEntity.name;
    return SingleChildScrollView(
      child: Center(
        child: Card(
            child: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          width: 900,
          child: Column(
            children: [
              TextFormField(
                controller: _dateController.telInputController,
                decoration: InputDecoration(labelText: 'Telefone'),
              ),
              TextFormField(
                controller: _dateController.nameInputController,
                decoration: InputDecoration(labelText: 'Nome'),
              ),
              Form(
                key: _dateController.formKey,
                child: DateTimeField(
                  controller: _dateController.tdatedInputController,
                  format: format,
                  validator: (value) {
                    if (value == null) return 'Selecione uma data';
                    return null;
                  },
                  onShowPicker: (context, currentValue) async {
                    return await showDatePicker(
                      context: context,
                      firstDate: DateTime(1900),
                      initialDate: currentValue ?? DateTime.now(),
                      lastDate: DateTime(2100),
                    ).then((DateTime? date) async {
                      if (date != null) {
                        final time = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.fromDateTime(
                              currentValue ?? DateTime.now()),
                        );
                        return DateTimeField.combine(date, time);
                      } else {
                        return currentValue;
                      }
                    });
                  },
                ),
              ),
              Row(
                children: [
                  TextButton(
                      onPressed: _dateController.validFormU,
                      child: const Text('Agendar')),
                  TextButton(
                      onPressed: Get.back, child: const Text('Cancelar')),
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
