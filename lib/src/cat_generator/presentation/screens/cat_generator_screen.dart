import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
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
      body: Center(
        child: Column(
          children: [
            Image.network('https://cataas.com/cat/gif'),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  
                });
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
