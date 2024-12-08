import 'package:flutter/material.dart';

class ShirtWidget extends LeafRenderObjectWidget {
  final Color color;
  const ShirtWidget({super.key, required this.color});
  @override
  RenderObject createRenderObject(BuildContext context) {
    // TODO: implement createRenderObject
    return ShirtRenderBox(color);
  }

  @override
  void updateRenderObject(BuildContext context, covariant ShirtRenderBox renderObject) {
   renderObject.color = color;
    super.updateRenderObject(context, renderObject);
  }
}

class ShirtRenderBox extends RenderBox{
  Color _color;
  ShirtRenderBox(Color color): _color = color;

  Color get color => _color;

  set color(Color value){
    if(_color == value) return;
    _color = value;
    markNeedsPaint();
  }

  @override
  bool get sizedByParent => true;

  @override
  void paint(PaintingContext context, Offset offset) {
    final paint = Paint()..color = color;
    context.canvas.drawRect(offset & size, paint);
  }

  @override
  Size computeDryLayout(covariant BoxConstraints constraints) {
    return Size(constraints.maxWidth, constraints.maxHeight);
  }
}


class TravellingBagWidget extends MultiChildRenderObjectWidget{
  @override
  RenderObject createRenderObject(BuildContext context) {
    // TODO: implement createRenderObject
    throw UnimplementedError();
  }

  @override
  void updateRenderObject(BuildContext context, covariant RenderObject renderObject) {
    Column;
  }
}