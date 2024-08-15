import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class Add extends StatefulWidget {
  const Add({super.key});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  var fileName = '';
  //file picker functionality for seleting a PDF
  Future<String> getPDF() async {
    FilePickerResult? selectorResult = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (selectorResult != null) {
      Uint8List fileBytes = selectorResult.files.first.bytes as Uint8List;
      String fileName = selectorResult.files.first.name;
      return 'filename: ' + fileName;
    } else {
      return 'No file selected';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Add a Pattern',
            style: Theme.of(context).textTheme.titleLarge),
      ),
      body: Card(
        margin: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: Text(
                'Upload and share patterns with other crafters.',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Pattern Name',
                  hintStyle: Theme.of(context).textTheme.labelLarge,
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
            ),
            //button for uploading the PDF
            Center(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: FilledButton(
                  onPressed: () async {
                    fileName = await getPDF();
                    setState(() {});
                  },
                  child: const Text("Select a PDF"),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  fileName,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ),
            //button to submit the PDF pattern to db
            Center(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: FilledButton(
                  onPressed: () {},
                  child: const Text('Upload your Pattern'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
