import 'dart:convert';
import 'package:mercadopago_sdk/mercadopago_sdk.dart';

import 'package:flutter/material.dart';
import 'package:horario/features/pix/presentation/tela_dados_pix.dart';
import 'package:http/http.dart' as http;

MPRestClient _restClient = MPRestClient();

class CriaChavePix extends StatefulWidget {
  Map<String, dynamic> dadosPix;
  CriaChavePix(this.dadosPix, {super.key});

  @override
  _CriaChavePix createState() => _CriaChavePix();
}

class _CriaChavePix extends State<CriaChavePix> {
  String chavePix = '';

  Future<void> criaChavePix() async {
    var bodyMap = {
      "transaction_amount": 20,
      "payment_method_id": "pix",
      "payer": {
        "email": "XXXXXX@email.com",
        "first_name": "first_name",
        "last_name": "last_name",
        "identification": {
          "type": "identification_type",
          "number": "number_cpf"
        }
      }
    };

    var url = Uri.parse('https://api.mercadopago.com/v1/payments/');

    var response = await http.post(url,
        headers: {
          "Authorization":
              "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
        },
        body: json.encode(bodyMap));

    if (response.statusCode == 201) {
      Map<String, dynamic> resultado = json.decode(response.body);

      Navigator.of(context).push(
          MaterialPageRoute(builder: ((context) => TelaDadosPix(resultado))));
    } else {
      throw Exception(response.body);
    }
  }

  @override
  void initState() {
    super.initState();
    criaChavePix();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Center(
        child: CircularProgressIndicator(
          color: Colors.blueAccent,
        ),
      ),
    );
  }
}
