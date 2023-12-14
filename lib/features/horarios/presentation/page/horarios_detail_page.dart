import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horario/core/configs/route.dart';
import 'package:horario/features/Date/domain/entities/date_entity.dart';
import 'package:horario/features/Date/domain/enum/horarios_status_type.dart';
import 'package:horario/features/Date/presentation/controller/date_controller.dart';
import 'package:horario/features/horarios/presentation/widgets/register_dialog_date.dart';

class HorarioDetailsPage extends StatelessWidget {
  HorarioDetailsPage({super.key});

  final DateEntity item = Get.arguments;
  final date = Get.find<DateController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: Stack(children: [
          Scaffold(
            appBar: AppBar(
              title: const Text('Visualização - Horário'),
            ),
            drawer: Drawer(
              child: ListView(padding: EdgeInsets.zero, children: <Widget>[
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Text(
                    'Menu',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
                ListTile(
                    leading: const Icon(Icons.calendar_view_day_outlined),
                    title: const Text('Horários'),
                    onTap: () => Get.toNamed(RouteConfig.horarios)),
              ]),
            ),
            body: SingleChildScrollView(
              child: Column(children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  width: double.infinity,
                  color: Colors.blue[600],
                  child: Text('Pedido: #${item.id.toString().padLeft(4, '0')} ',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold)),
                ),
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
                  value: item.status,
                  onSaved: (_) {},
                  onChanged: (value) {
                    item.status = value!;
                    date.updateDate(item);
                  },
                ),
                const SizedBox(height: 20),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    final varDate = date.dateEntity[index];
                    return ListTile(
                      tileColor:
                          index % 2 == 0 ? const Color(0xFFE0E0E0) : null,
                      leading: Text('${varDate.tDated}'),
                      title: Text(varDate.name),
                      subtitle: Text('${varDate.id}'),
                      trailing: SizedBox(
                        width: 80,
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () => Get.dialog(
                                      DateRegisterWidget(dateEntity: item),
                                    ),
                                icon: const Icon(Icons.edit,
                                    color: Colors.blue)),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ]),
            ),
          )
        ]));
  }
}
