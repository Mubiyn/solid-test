import 'dart:async';
import 'dart:math' hide log;

import 'package:flutter/material.dart';
import 'package:solid_test/services/storage_service.dart';
import 'package:solid_test/utils/utils.dart';

/// This is the base class for the test app.
class SolidTest extends StatelessWidget {
  /// This is the constructor for the class.
  const SolidTest({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Solid Test',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const _SolidTestBody(),
    );
  }
}

class _SolidTestBody extends StatefulWidget {
  const _SolidTestBody({
    Key? key,
  }) : super(key: key);

  @override
  State<_SolidTestBody> createState() => __SolidTestBodyState();
}

class __SolidTestBodyState extends State<_SolidTestBody> {
  bool _isAnimated = false; //to animate the color change
  Color backgroundColor = kColorDefault;
  Color localColor = kColorDefault;

  /// Generate six unique random indices
  Set<int> indices = {}; //we use set because we don't want to repeat values

  /// Store the items at the selected indices
  List<String> selectedDigits = [];

  /// get last saved color from local preferences
  Future<void> _getSavedColor() async {
    await StorageService.getString().then(
      (value) => setState(() {
        localColor = StringUtils.parseColor(value);
      }),
    );
  }

  /// function to change background color
  Future<void> _changeBackgroundColor() async {
    //This is faster than using a list shuffle method
    while (indices.length < kColorLength) {
      final index = Random().nextInt(kColorString.length);
      indices.add(index);
    }

    for (final int index in indices) {
      selectedDigits.add(kColorString[index]);
    }

    final randomValues = StringUtils.addColorPrefix(selectedDigits);

    await Future.delayed(kAnimationDuration, () {
      setState(() {
        _isAnimated = true;
        backgroundColor = StringUtils.parseColor(randomValues);
      });
    });
  }

  @override
  void initState() {
    _getSavedColor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: const Key('tap'),
      onTap: () async {
        await _changeBackgroundColor();
        await StorageService.setString(
          StringUtils.addColorPrefix(selectedDigits),
        ).then((value) => _clearSelection());
      },
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: AnimatedContainer(
          duration: kAnimationDuration,
          width: double.infinity,
          height: double.infinity,
          color: _isAnimated ? backgroundColor : localColor,
          child: Center(
            child: Text(
              'Hello there!',
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
        ),
      ),
    );
  }

  /// used to reset the selection
  void _clearSelection() {
    indices.clear();
    selectedDigits.clear();
  }
}
