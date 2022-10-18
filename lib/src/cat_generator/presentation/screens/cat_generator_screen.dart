import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CatGeneratorScreen extends StatefulWidget {
  const CatGeneratorScreen({Key? key}) : super(key: key);

  @override
  State<CatGeneratorScreen> createState() => _CatGeneratorScreenState();
}

class _CatGeneratorScreenState extends State<CatGeneratorScreen> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cats Generator'),
      ),
      backgroundColor: Colors.lightBlue.shade100,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Meow for more cat GIFs!'),
            Image.network(
              'https://cataas.com/cat/gif',
              height: _size.width * .8,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {});
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: SvgPicture.asset(
                      'assets/images/cat.svg',
                      width: 20,
                      color: Colors.white,
                    ),
                  ),
                  const Text('Meow'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
