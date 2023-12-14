import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horario/core/configs/route.dart';
import 'package:horario/features/Date/domain/entities/date_entity.dart';
import 'package:horario/features/Date/domain/enum/horarios_status_type.dart';
import 'package:horario/features/Date/presentation/controller/date_controller.dart';
import 'package:horario/features/pix/presentation/tela_pix.dart';
import 'package:intl/intl.dart';

class DateRegisterPage extends StatelessWidget {
  DateRegisterPage({super.key});
  final _dateController = Get.find<DateController>();
  final format = DateFormat("yyyy-MM-dd HH:mm");
  //final DateEntity item = Get.arguments;
  final date = Get.find<DateController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
      Scaffold(
        
        body: SingleChildScrollView(
          child: Center(
            child: Card(
                child: Container(
                  child: SizedBox(
                    height: MediaQuery.sizeOf(context).height,
                    width: 900,
                    child: Column(children: [
                      DropdownButtonFormField<HorarioStatusType>(
                    items: [
                      ...HorarioStatusType.values.map(
                        (res) => DropdownMenuItem<HorarioStatusType>(
                          value: res,
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(res.name),
                          ),
                        ),
                      ),
                    ],
                    //value: item.status,
                    onSaved: (_) {},
                    onChanged: (value) {
                      //item.status = value!;
                      date.validFormU;
                    },
                  ),
                      TextFormField(
                      controller: _dateController.nameInputController,
                      decoration: InputDecoration(
                        labelText: 'Nome'
                      ),
                    ),
                      TextFormField(
                      controller: _dateController.telInputController,
                      decoration: InputDecoration(
                        labelText: 'Telefone'
                      ),
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
                    InkWell(
                      onTap: () => _dateController.validFormI(),
                      child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: 70,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.4),
                                    spreadRadius: 5,
                                    blurRadius: 6,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                        child: const Text(
                            ('Agendar'),
                            style: TextStyle(
                              color: Colors.blue
                            ),
                            ),
                      ),
                    ),
                        ]),
                    ),
                ),
                ),
            ),
          ),
        ),
        Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: double.infinity,
                        height: 120,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.4),
                                  spreadRadius: 5,
                                  blurRadius: 6,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                  child: Text('Pagar'),
                                  onPressed: (() => Get.toNamed(RouteConfig.telaPix)),
                                ),
                                TextButton(
                                  child: Text('Voltar'),
                                  onPressed: () => Get.toNamed(RouteConfig.datePage),
                                ),
                              ],
                            ),
                        ),
                      ),
      ]
    );
  }
}
