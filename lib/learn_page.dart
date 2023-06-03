import 'package:flutter/material.dart';

class LearnPage extends StatefulWidget {
  const LearnPage({super.key});

  @override
  State<LearnPage> createState() => _LearnPageState();
}

class _LearnPageState extends State<LearnPage> {
  // variables
  bool isSwitched = false;
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn'),
        automaticallyImplyLeading: false, // by default back arrow is upported
        leading: IconButton(
          onPressed: () {
            // delete this page and it will retrun to the prevous one.
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        actions: [
          IconButton(
            onPressed: () {
              debugPrint('actions');
            },
            icon: const Icon(Icons.nightlight_round),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('imgs/img.jpg'),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            const Text('hello'),
            Container(
              color: Colors.blueGrey,
              width: double.infinity,
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.all(10.0),
              child: const Center(
                child: Text(
                  'Text box',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: isSwitched ? Colors.blue : Colors.green),
              onPressed: () {
                debugPrint('Elevated button!');
              },
              child: const Text('elevated btn'),
            ),
            OutlinedButton(
              onPressed: () {
                debugPrint('OutlinedButton!');
              },
              child: const Text('OutlinedButton'),
            ),
            TextButton(
              onPressed: () {
                debugPrint('TextButton!');
              },
              child: const Text('TextButton'),
            ),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                debugPrint('tap!');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Visibility(
                    visible: isChecked,
                    child: const Icon(
                      Icons.local_fire_department,
                      color: Colors.red,
                    ),
                  ),
                  const Text('Row Widget'),
                  Visibility(
                    visible: isChecked,
                    child: const Icon(
                      Icons.local_fire_department,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
            ),
            Switch(
              value: isSwitched,
              onChanged: (bool newBool) {
                // setState is the one that update the UI
                setState(() {
                  isSwitched = newBool;
                });
              },
            ),
            Checkbox(
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value ?? false;
                  });
                }),
            Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQX-KtKl-bH_trYNEBX2XVEmP7FyQqZFK0616ZoNY8SiauM732f31XKVEKKO7MaPyj2mmY&usqp=CAU',
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
