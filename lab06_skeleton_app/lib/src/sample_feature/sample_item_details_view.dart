import 'package:flutter/material.dart';

/// Displays detailed information about a SampleItem.
class SampleItemDetailsView extends StatelessWidget {
  const SampleItemDetailsView({super.key});

  static const routeName = '/sample_item';

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Lý Ngọc Bách - 2121051137',
              style: TextStyle(
                color: Color.fromARGB(255, 243, 201, 33),
                fontSize: 32,
              ),
            ),
            SizedBox(height: 20), // Adjust the height as needed
            Image.network(
              'https://scontent.fsgn5-9.fna.fbcdn.net/v/t1.15752-9/363535554_937491114475705_2863256835274452944_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=8cd0a2&_nc_ohc=vcCO1-08KdUAX9cdYIV&_nc_ht=scontent.fsgn5-9.fna&oh=03_AdS9SxKypeBoCyID98cT3rBhdsjiQraKgaVldocqpyvhhw&oe=657706D4',
              height: 500, // Adjust the height as needed
              width: 500, // Adjust the width as needed
            ),
          ],
        ),
      ),
    );
  }
}