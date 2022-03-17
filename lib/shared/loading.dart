import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  const Loading({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[800],
      child: Center(
        child: SpinKitDualRing(
          color: Colors.orange.shade400,
          size: 50.0,
        ),
      ),
    );
  }
}

class LoadingDelete extends StatelessWidget {
  const LoadingDelete({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 40.0, maxWidth: 40.0),
      child: Center(
        child: SpinKitDualRing(
          color: Colors.orange.shade400,
          size: 40.0,
        ),
      ),
    );
  }
}