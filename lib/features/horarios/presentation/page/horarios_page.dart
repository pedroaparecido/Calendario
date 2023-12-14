import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horario/core/configs/route.dart';
import 'package:horario/features/Date/domain/entities/date_entity.dart';
import 'package:horario/features/Date/presentation/controller/date_controller.dart';
import 'package:horario/features/horarios/presentation/widgets/register_dialog_date.dart';

class HorarioPage extends StatelessWidget {
  HorarioPage({super.key});

  final _dateController = Get.put(DateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: const Text('Horários'),
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
        child: Stack(children: [
          const SizedBox(height: 15),
          Center(
            child: SizedBox(
              width: 900,
              height: MediaQuery.sizeOf(context).height,
              child: Card(
                elevation: 5,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Obx(
                    () => ListView.builder(
                        itemCount: _dateController.dateEntity.length,
                        itemBuilder: (context, index) {
                          final date = _dateController.dateEntity[index];
                          return ListTile(
                            tileColor:
                                index % 2 == 0 ? const Color(0xFFE0E0E0) : null,
                            leading: Text('${date.tDated}'),
                            title: Text('${date.name}'),
                            subtitle: Text('${date.id}'),
                            trailing: SizedBox(
                              width: 80,
                              child: Row(
                                children: [
                                  IconButton(
                                      onPressed: () => Get.offNamed(RouteConfig.horariosDetail, arguments: date),
                                      icon: const Icon(Icons.search,
                                          color: Colors.blue)),
                                  IconButton(
                                    icon: const Icon(Icons.delete,
                                        color: Colors.red),
                                    onPressed: () =>
                                        _dateController.deleteDate(date.id!),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class DateTileWidget extends StatelessWidget {
  final DateEntity date;
  final int index;
  final void Function()? onView;

  const DateTileWidget(
      {super.key,
      required this.date,
      required this.index,
      required this.onView});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: index % 2 == 0 ? const Color(0xFFE0E0E0) : null,
      title:
          Text('#${date.id.toString().padLeft(4, '0')} - ${date.status.name} - '
              'date: ${date.tDated}  '),
      // subtitle: Text(RegularizeHelper.doubleToRealCurrency(value: date.total)),
      trailing: SizedBox(
        width: 80,
        child: Row(
          children: [
            IconButton(
                onPressed: onView,
                icon: const Icon(Icons.search, color: Colors.blue)),
            IconButton(
              icon: const Icon(Icons.cancel, color: Colors.red),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
