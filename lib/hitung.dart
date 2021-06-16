import 'package:flutter/material.dart';

class Hitung extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HitungState();
  }
}

class HitungState extends State<Hitung> {
  final TextEditingController _ageController = new TextEditingController();
  final TextEditingController _weightController = new TextEditingController();
  final TextEditingController _heightController = new TextEditingController();
  double _meter = 0.0;
  double _result = 0.0;
  String _finalResultPrint = "";
  String _doneResult = "";

  void _clear() {
    setState(() {
      _ageController.clear();
      _weightController.clear();
      _heightController.clear();
    });
  }

  void _bmiValue() {
    setState(() {
      double age = double.parse(_ageController.text);
      double weight = double.parse(_weightController.text);
      double height = double.parse(_heightController.text);
      _meter = height / 100;

      if ((_ageController.text.isNotEmpty || age > 0) &&
          ((_heightController.text.isNotEmpty || height > 0) &&
              (_weightController.text.isNotEmpty || weight > 0))) {
        _result = weight / (_meter * _meter);
      } else {
        print("Error");
      }

      if ((double.parse(_result.toStringAsFixed(1)) < 18.5)) {
        _finalResultPrint = "Kekurusan";
        print(_finalResultPrint);
      } else if (double.parse(_result.toStringAsFixed(1)) > 18.5 &&
          (double.parse(_result.toStringAsFixed(1)) <= 25.0)) {
        _finalResultPrint = "Normal";
        print(_finalResultPrint);
      } else if ((double.parse(_result.toStringAsFixed(1)) > 25.0) &&
          (double.parse(_result.toStringAsFixed(1))) < 30.0) {
        _finalResultPrint = "Kegemukan";
        print(_finalResultPrint);
      } else if ((double.parse(_result.toStringAsFixed(1))) >= 30.0) {
        _finalResultPrint = "Obesitas";
        print(_finalResultPrint);
      }
    });

    _doneResult =
        "Indeks Massa Tubuh kamu adalah  ${_result.toStringAsFixed(1)}";
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Indeks Massa Tubuh"),
        backgroundColor: Colors.grey,
        centerTitle: true,
      ),
      body: new Container(
        child: new ListView(
          children: <Widget>[
            new Center(
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _ageController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: "Umur",
                      icon: Icon(Icons.person),
                    ),
                  ),
                  new TextField(
                    controller: _heightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      hintText: "dalam centimeter",
                      labelText: "Tinggi Badan",
                      icon: Icon(Icons.bubble_chart),
                    ),
                  ),
                  new TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      hintText: "dalam kilogram",
                      labelText: "Berat Badan",
                      icon: Icon(Icons.line_weight),
                    ),
                  ),
                  new Padding(padding: EdgeInsets.all(10.0)),
                  new Row(
                    children: <Widget>[
                      new Container(
                          margin: EdgeInsets.only(left: 100.0),
                          child: new RaisedButton(
                            onPressed: _bmiValue,
                            color: Colors.grey,
                            child: new Text(
                              "Hitung",
                              style: new TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              ),
                            ),
                          )),
                      new Container(
                          margin: EdgeInsets.only(left: 10.0),
                          child: new RaisedButton(
                            onPressed: _clear,
                            color: Colors.grey,
                            child: new Text(
                              "Hapus",
                              style: new TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              ),
                            ),
                          ))
                    ],
                  ),
                  new Padding(padding: EdgeInsets.all(10.0)),
                  new Text(
                    '$_doneResult',
                    style: new TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w800,
                        color: Colors.grey),
                  ),
                  new Text(
                    "$_finalResultPrint",
                    style: new TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.w800,
                        color: Colors.grey),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
