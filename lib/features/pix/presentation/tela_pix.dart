import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horario/core/configs/route.dart';
import 'package:horario/features/pix/presentation/cria_chave_pix.dart';

class TelaPix extends StatefulWidget {
  const TelaPix({Key? key}) : super(key: key);

  @override
  _TelaPixState createState() => _TelaPixState();
}

class _TelaPixState extends State<TelaPix> {
  double valorpix = 20.0;
  Map<String, dynamic> dadosPix = Map();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        appBar: AppBar(
          title: Text('Pagamento pix'),
        ),
        body: Center(
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
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 24.0,
                      ),
                      Text(
                        'O valor a ser pago é de R\$$valorpix',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black, fontSize: 30),
                      ),
                      SizedBox(
                        height: 48.0,
                      ),
                      Container(
                        height: 120,
                        width: double.infinity,
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
                              dadosPix = {"valorpix": valorpix};
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      CriaChavePix(dadosPix)));
                            },
                            child: Text('Gerar pix')),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
