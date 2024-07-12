import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../Model/medicament.dart';

  // Assurez-vous que le fichier medicament.dart est correctement importé


class MedicamentForm extends StatefulWidget {
  @override
  _MedicamentFormState createState() => _MedicamentFormState();
}

class _MedicamentFormState extends State<MedicamentForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _categorieController = TextEditingController();
  File? _image;

  final picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> _saveMedicament() async {
    if (_formKey.currentState!.validate() && _image != null) {
      try {
        // Upload image to Firebase Storage
        String fileName = '${DateTime.now().millisecondsSinceEpoch}.png';
        Reference storageReference = FirebaseStorage.instance.ref().child('medicaments/$fileName');
        UploadTask uploadTask = storageReference.putFile(_image!);
        await uploadTask.whenComplete(() => null);
        String photoUrl = await storageReference.getDownloadURL();

        Medicament medicament = Medicament(
          nomMedicament: _nomController.text,
          categorieMedicament: _categorieController.text,
          photoUrl: photoUrl,
        );

        await FirebaseFirestore.instance.collection('medicaments').add(medicament.toMap());

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Médicament ajouté avec succès')));
      } catch (e) {
        print(e);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Erreur lors de l\'ajout du médicament')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter un Médicament'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                controller: _nomController,
                decoration: InputDecoration(labelText: 'Nom du Médicament'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer le nom du médicament';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _categorieController,
                decoration: InputDecoration(labelText: 'Catégorie du Médicament'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer la catégorie du médicament';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              _image == null
                  ? Text('Aucune image sélectionnée')
                  : Image.file(_image!),
              ElevatedButton(
                onPressed: _pickImage,
                child: Text('Sélectionner une Image'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveMedicament,
                child: Text('Enregistrer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
