import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import './home_view.dart';

class Add extends StatefulWidget {
  const Add({super.key});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  final _namaMahasiswa = new TextEditingController();
  final _jurusan = new TextEditingController();
  final _alamat = new TextEditingController();
  final _noHp = new TextEditingController();

  void _SimpanData() async {
    FirebaseFirestore.instance.runTransaction((transaction) async {
      CollectionReference reference =
          FirebaseFirestore.instance.collection("listdata");
      await reference.add({
        "nama": _namaMahasiswa.text,
        "jurusan": _jurusan.text,
        "alamat": _alamat.text,
        "no_henphone": _noHp.text,
      });
    });

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Data Tersimpan"),
          content: const Text("Data berhasil disimpan."),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.pop(context);
                _namaMahasiswa.clear();
                _jurusan.clear();
                _alamat.clear();
                _noHp.clear();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Input Data"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  controller: _namaMahasiswa,
                  decoration: const InputDecoration(
                    labelText: "Nama Mahasiswa",
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _jurusan,
                  decoration: const InputDecoration(
                    labelText: "Jurusan",
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _alamat,
                  decoration: const InputDecoration(
                    labelText: "Alamat",
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _noHp,
                  decoration: const InputDecoration(
                    labelText: "No Henphone",
                  ),
                ),
                SizedBox(height: 10),
                OutlinedButton(
                  onPressed: () => _SimpanData(),
                  child: const Text("Simpan"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
