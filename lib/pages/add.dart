import 'package:flutter/material.dart';

class Add extends StatefulWidget {
  const Add({super.key});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
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
                  onPressed: () {},
                  child: const Text('Select a PDF'),
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
