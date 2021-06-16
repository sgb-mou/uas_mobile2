import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('BIODATA'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            DataTable(
              columns: [
                DataColumn(label: Text('')),
                DataColumn(label: Text('')),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('Nama Mahasiswa')),
                  DataCell(Text('Ovando Exha Valendro',
                      style: TextStyle(fontWeight: FontWeight.bold))),
                ]),
                DataRow(cells: [
                  DataCell(Text('Jenis Kelamin')),
                  DataCell(Text('Laki - Laki',
                      style: TextStyle(fontWeight: FontWeight.bold))),
                ]),
                DataRow(cells: [
                  DataCell(Text('ALamat')),
                  DataCell(Text('Jalan Pabrik Tenun No.76 Medan',
                      style: TextStyle(fontWeight: FontWeight.bold))),
                ]),
                DataRow(cells: [
                  DataCell(Text('Jurusan')),
                  DataCell(Text('Sistem  Informasi',
                      style: TextStyle(fontWeight: FontWeight.bold))),
                ]),
              ],
            ),
            SizedBox(height: 10),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/hitung');
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width / 1.2,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.grey,
                        Colors.grey,
                      ],
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                child: Center(
                  child: Text(
                    'Program Aritmatika'.toUpperCase(),
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
