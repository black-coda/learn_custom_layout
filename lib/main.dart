import 'dart:developer';

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: const Color(0xff03569A),
          child: CustomPaint(
            size: const Size(500, 500),
            // size: Size(MediaQuery.sizeOf(context).width,
            //     MediaQuery.sizeOf(context).height),
            painter: HeartPainter(),
          ),
        ),
      ),
    );
  }
}

class BackGround1 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.white.withOpacity(0.2);
    final path = Path();
    path.moveTo(0, 0);
    log('size.width: ${size.width}, size.height: ${size.height}');
    path.lineTo(size.width * 0.2, 0);
    path.lineTo(0, size.height * 0.4);
    path.close();

    final bottomPath = Path();
    bottomPath.moveTo(size.width * 0.8, 0);
    bottomPath.lineTo(size.width, 0);
    bottomPath.lineTo(size.width, size.height);
    bottomPath.lineTo(size.width * 0.2, size.height);
    bottomPath.close();

    canvas.drawPath(path, paint);
    canvas.drawPath(bottomPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}

class BackGround2Painter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = const Color(0xff018DE6);
    final paint1 = Paint()..color = const Color(0xff00B2C8);
    final paint2 = Paint()..color = const Color(0xff00B0C5);

    final x = size.width;
    final y = size.height;
    final path0 = Path()
      ..moveTo(0, y * 0.1)
      ..lineTo(0, 0)
      ..lineTo(x, 0)
      ..lineTo(x, y * 0.5)
      ..lineTo(x * 0.61, y * 0.6)
      ..close();

    final path1 = Path()
      ..moveTo(x, y * 0.5)
      ..lineTo(x, y * 0.9)
      ..lineTo(x * 0.61, y * 0.6)
      ..close();

    final path2 = Path()
      ..moveTo(0, y * 0.6)
      ..lineTo(0, y * 0.1)
      ..lineTo(x * 0.549, y * 0.55)
      ..close();

    canvas.drawPath(path0, paint);
    canvas.drawPath(path1, paint1);
    canvas.drawPath(path2, paint2);
  }

  @override
  bool shouldRepaint(BackGround2Painter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(BackGround2Painter oldDelegate) => false;
}

class BackGround3Painter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final whitePaint = Paint()..color = Colors.white;
    final lightBluePaint = Paint()..color = const Color(0xff30CFFF);
    final deepBluePaint = Paint()..color = const Color(0xff03569A);
    final bluePaint = Paint()..color = const Color(0xff018DE6);
    final darkBluePaint = Paint()..color = const Color(0xff024C8B);

    //  backgroud
    final backPath = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width * 0.2, 0)
      ..lineTo(size.width * 0.36, size.height * 0.2)
      ..lineTo(size.width * 0.05, size.height)
      ..lineTo(0, size.height)
      ..close();

    final whiteBackPath = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width * 0.17, 0)
      ..lineTo(size.width * 0.4, size.height * 0.3)
      ..lineTo(size.width * 0.1, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(backPath, lightBluePaint);
    canvas.drawPath(whiteBackPath, whitePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue // Set the line color
      ..strokeWidth = 5.0; // Adjust line thickness as needed

    canvas.drawLine(
        const Offset(0.0, 0.0), Offset(size.width * 0.4, size.height), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class RectanglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.orange // Set the line color
      ..strokeWidth = 5.0; // Adjust line thickness as needed
    const rect = Rect.fromLTWH(0, 0, 300, 200);
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Class for drawing a circle

class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke; // Fill the circle

    final center = Offset(size.width / 2, size.height / 2);

    final radius = size.width / 4; // Adjust radius as needed

    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class HeartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.pink
      ..style = PaintingStyle.fill;

    final path = Path();

    path.moveTo(size.width / 2, size.height / 2); // Start at the center

    // Create the heart shape using various path methods

    path.quadraticBezierTo(size.width * 0.75, size.height * 0.35,
        size.width / 2, size.height * 0.2);

    path.arcToPoint(Offset(size.width * 0.25, size.height * 0.35),
        radius: const Radius.circular(20.0), clockwise: false);

    path.quadraticBezierTo(size.width / 2, size.height * 0.7, size.width * 0.75,
        size.height * 0.35);

    path.close(); // Close the path to create a filled shape

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
