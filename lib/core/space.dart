import 'package:flutter/cupertino.dart';

class SpaceVH extends StatefulWidget {
  final double? height;
  final double? width;
  const SpaceVH({Key? key, this.height, this.width}) : super(key: key);

  @override
  State<SpaceVH> createState() => _SpaceVHState();
}

class _SpaceVHState extends State<SpaceVH> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height != null ? widget.height : 0.0,
      width: widget.width != null ? widget.width : 0.0,
    );
  }
}