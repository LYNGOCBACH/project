import 'package:flutter/material.dart';
import 'package:lab05/widgets/counter_button.dart';
import 'package:lab05/widgets/counter_lable.dart';

class CounterView extends StatelessWidget {
  const CounterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter App')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Thêm hình ảnh vào đây
            Image.network(
              'https://scontent.fsgn5-9.fna.fbcdn.net/v/t1.15752-9/363535554_937491114475705_2863256835274452944_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=8cd0a2&_nc_ohc=gx5_Is0j_UwAX-ELoa6&_nc_ht=scontent.fsgn5-9.fna&oh=03_AdQt5DRkdQj24ow7zPVclJEt7NoJ_F1dyb6cj5tGeT0vSw&oe=656F1DD4',
              width: 500, // Thay đổi kích thước ảnh tại đây
              height: 500, // Thay đổi kích thước ảnh tại đây
              // fit: BoxFit.cover,
            ),
            const CounterLabel(),
            const CounterButton(),
            Text(
              'Chạm vào - để giảm, chạm vào + để tăng',
              style: Theme.of(context).textTheme.caption,
            ),
            const Text('Lý Ngọc Bách - 2121051137', style: TextStyle(
              color: Color.fromARGB(255, 243, 33, 33),
              fontSize: 32,
            )),
          ],
        ),
      ),
    );
  }
}