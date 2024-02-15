import 'package:flutter/material.dart';

class CampoTexto extends StatefulWidget {
  const CampoTexto({super.key});

  @override
  State<CampoTexto> createState() => _CampoTextoState();
}

class _CampoTextoState extends State<CampoTexto> {
  TextEditingController valorAlcool = TextEditingController();
  TextEditingController valorGasolina = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 253, 250, 190),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 175, 195, 230),
        centerTitle: true,
        title: const Text('Qual combustivel?'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: Image.asset("assets/image/logo.png"),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              child: Text("Saiba qual a melhor opção para abastecer seu carro.",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 25),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: 'Preço do Álcool, ex: 2.599',
                    labelStyle: TextStyle(fontSize: 15)),
                enabled: true, //Ativa e desativa campo de texto
                style: const TextStyle(
                    fontSize: 20, color: Color.fromARGB(255, 24, 2, 8)),
                onSubmitted: (String texto) {},
                controller: valorAlcool,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: 'Preço da Gásolina, ex: 5.379',
                    labelStyle: TextStyle(fontSize: 15)),
                enabled: true, //Ativa e desativa campo de texto
                style: const TextStyle(
                    fontSize: 20, color: Color.fromARGB(255, 24, 2, 8)),
                onSubmitted: (String texto) {},
                controller: valorGasolina,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 1),
              child: TextButton(
                  onPressed: calcular,
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      fixedSize: const Size(330, 50)),
                  child: const Text(
                    "Calcular",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
              child: Text(
                resultText,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 88, 252)),
              ),
            )
          ],
        ),
      ),
    );
  }

  String resultText =
      'Preencha os campos acima e click no botão para obter o resultado.';

  void calcular() {
    double? precoAlcool = double.tryParse(valorAlcool.text);
    double? precoGas = double.tryParse(valorGasolina.text);

    if (precoAlcool == null || precoGas == null) {
      setState(() {
        resultText =
            "Numeros inválidos, digite números maiores que 0 e usando ponto (.)";
      });
    } else {
      setState(() {
        if (precoAlcool / precoGas >= 0.7) {
          resultText = "Abasteça com gasolina";
        } else {
          resultText = "Abasteça com álcool";
        }
      });
    }
    valorAlcool.clear();
    valorGasolina.clear();
  }
}
