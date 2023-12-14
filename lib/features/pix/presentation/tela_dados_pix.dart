import 'dart:convert';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:horario/core/configs/route.dart';
import 'package:horario/features/Date/presentation/controller/date_controller.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class TelaDadosPix extends StatefulWidget {
  Map<String, dynamic> dadosPix;

  TelaDadosPix(this.dadosPix);

  _TelaDadosPix createState() => _TelaDadosPix();
}

class _TelaDadosPix extends State<TelaDadosPix> {
  String statusPix = " ";
  final date = Get.find<DateController>();

  Future<void> pesquisaStatusPix() async {
    var url = Uri.parse('https://api.mercadopago.com/v1/payments/');
    var bodyMap = {"issuer_id": widget.dadosPix["issuer_id"]};
    var response = await http.post(url,
        headers: {
          "Authorization":
              "Bearer APP_USR-7419241773794749-101913-95b0aabbfdd603c98c46c6607d70c0a2-458440520",
        },
        body: json.encode(bodyMap));

    statusPix = response.body;

    while (widget.dadosPix["issuer_id"] != null) {
      if (widget.dadosPix["status"] == "pending") {
        await Future.delayed(Duration(seconds: 5));
        Get.toNamed(RouteConfig.statusPendentePix);
      } else if (widget.dadosPix["status"] == "approved") {
        Get.toNamed(RouteConfig.statusAutorizadoPix);
        TextButton(
          onPressed: date.validFormI,
          child: Text("Marcar horário!"),
        );
        break;
      } else if (widget.dadosPix["status"] == "authorized") {
        Get.toNamed(RouteConfig.statusAutorizadoPix);
        TextButton(
          onPressed: date.validFormI,
          child: Text("Marcar horário!"),
        );
        break;
      } else if (widget.dadosPix["status"] != "approved" &&
          widget.dadosPix["status"] != "authorized") {
        Get.toNamed(RouteConfig.statusNegadoPix);
        break;
      }
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Card(
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
            child: ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Status do Pagamento Pix:",
                              style: TextStyle(
                                  fontSize: 25.0, fontWeight: FontWeight.bold)),
                          Text(widget.dadosPix["status"],
                              style: TextStyle(
                                  fontSize: 18.0, color: Colors.green)),
                          SizedBox(
                            height: 16.0,
                          ),
                          Text(
                              NumberFormat("#,##0.00", "pt_BR").format(
                                  widget.dadosPix["transaction_amount"]),
                              style: TextStyle(
                                  fontSize: 25.0, color: Colors.green))
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                              height: 36,
                              width: 36,
                              child: Image.asset(
                                "images/um.png",
                              )),
                          SizedBox(
                            width: 8.0,
                          ),
                          Expanded(
                              child: Text(
                                  "Abra o app do seu banco ou seu app de pagamentos.",
                                  style: TextStyle(
                                      fontSize: 18.0, color: Colors.black)))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                              height: 36,
                              width: 36,
                              child: Image.asset(
                                "images/dois.png",
                              )),
                          SizedBox(
                            width: 8.0,
                          ),
                          Expanded(
                              child: Text("Busque á opção de pagar com pix.",
                                  style: TextStyle(
                                      fontSize: 18.0, color: Colors.black)))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                              height: 36,
                              width: 36,
                              child: Image.asset(
                                "images/tres.png",
                              )),
                          SizedBox(
                            width: 8.0,
                          ),
                          Expanded(
                              child: Text("Copie e cole o seguinte código.",
                                  style: TextStyle(
                                      fontSize: 18.0, color: Colors.black)))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.blue,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                widget.dadosPix["point_of_interaction"]
                                    ["transaction_data"]["qr_code"],
                                style: TextStyle(fontSize: 14.0),
                              )),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SizedBox(
                        height: 44.0,
                        width: double.infinity,
                        child: Container(
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
                            onPressed: () {
                              FlutterClipboard.copy(
                                  widget.dadosPix["point_of_interaction"]
                                      ["transaction_data"]["qr_code"]);
                            },
                            child: Text(
                              "COPIAR CHAVE",
                              style: TextStyle(fontSize: 18.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SizedBox(
                        height: 44.0,
                        width: double.infinity,
                        child: Container(
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
                            onPressed: () {
                              pesquisaStatusPix();
                            },
                            child: Text(
                              "Agendar",
                              style: TextStyle(fontSize: 18.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    )));
  }
}
