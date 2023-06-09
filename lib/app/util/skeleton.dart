import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonWidget extends StatefulWidget {
  double? height, width;
  bool isPhoto;
  SkeletonWidget({Key? key, this.height, this.width,this.isPhoto = false}) : super(key: key);

  @override
  _SkeletonWidgetState createState() => _SkeletonWidgetState();
}

class _SkeletonWidgetState extends State<SkeletonWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.white,
        child: Container(
          height: widget.height,
          width: widget.width,
          decoration: (!widget.isPhoto)?null
              :
              BoxDecoration(
                shape: BoxShape.circle
              ),
          child: Container(
            color: Colors.grey[300],
          ),
        ),
      ),
    );
  }
}
