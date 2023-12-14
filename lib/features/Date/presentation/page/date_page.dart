import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horario/core/configs/route.dart';
import 'package:horario/features/Date/presentation/controller/date_controller.dart';

class DatePage extends StatelessWidget {
  DatePage({super.key});

  final _dateController = Get.put(DateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Horários marcados'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                width: 900,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 20.0,
                  )
                ]),
                alignment: Alignment.topCenter,
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).height,
                  width: 900,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Obx(
                      () => ListView.builder(
                        itemCount: _dateController.dateEntity.length,
                        itemBuilder: (context, index) {
                          final date = _dateController.dateEntity[index];
                          return ListTile(
                            tileColor:
                                index % 2 == 0 ? const Color(0xFFE0E0E0) : null,
                            leading: Text('${date.tDated}'),
                            title: Text(date.name),
                            subtitle: Text('${date.id}'),
                            trailing: Text('${date.status.name}'),
                          );
                        },
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
                child: TextButton(
                  child: Text('Marcar Horário'),
                  onPressed: () => Get.toNamed(RouteConfig.register),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
