import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:horario/core/configs/route.dart';
import 'package:horario/features/Date/presentation/page/date_page.dart';
import 'package:horario/features/Date/presentation/page/date_register_page.dart';
import 'package:horario/features/admin/presentation/admin_page.dart';
import 'package:horario/features/auth/preseentation/pages/login_page.dart';
import 'package:horario/features/horarios/presentation/page/horarios_detail_page.dart';
import 'package:horario/features/horarios/presentation/page/horarios_page.dart';
import 'package:horario/features/pix/presentation/status_aprovado_pix.dart';
import 'package:horario/features/pix/presentation/status_negado_pix.dart';
import 'package:horario/features/pix/presentation/status_pendente_pix.dart';
import 'package:horario/features/pix/presentation/tela_pix.dart';
import 'package:mercado_pago_mobile_checkout/mercado_pago_mobile_checkout.dart';
import 'service_locator.dart' as service_locator;

void main() {
  service_locator.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static bool isAdmin = true;

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Agenda de horários',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: RouteConfig.datePage,
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: RouteConfig.datePage, page: () => DatePage()),
        GetPage(name: RouteConfig.register, page: () => DateRegisterPage()),
        GetPage(name: RouteConfig.horarios, page: () => isAdmin ? HorarioPage() : LoginPage()),
        GetPage(name: RouteConfig.login, page: () => LoginPage()),
        GetPage(name: RouteConfig.admin, page: () => AdminPage()),
        GetPage(name: RouteConfig.telaPix, page: () => TelaPix()),
        GetPage(name: RouteConfig.statusAutorizadoPix, page: () => StatusAprovadoPix()),
        GetPage(name: RouteConfig.statusNegadoPix, page: () => StatusNegadoPix()),
        GetPage(name: RouteConfig.statusPendentePix, page: () => StatusPendentePix()),
        GetPage(name: RouteConfig.horariosDetail, page: () => HorarioDetailsPage()),
      ],
    );
  }
}