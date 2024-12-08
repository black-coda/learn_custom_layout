// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';
import 'dart:math' as math;

import 'package:flutter/material.dart';

void main() {
  runApp(const StripedBackground());
}


class StripedBackground extends StatelessWidget {
  const StripedBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection:
          TextDirection.ltr, // Use TextDirection.rtl for right-to-left
      child: Scaffold(
        body: CustomPaint(
          size: Size(double.infinity, 100),
          painter: StripedPainter(),
        ),
      ),
    );
  }
}
// class StripedBackground extends StatelessWidget {
//   const StripedBackground({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomPaint(
//         size: Size(double.infinity, 100), // Set desired height
//         painter: StripedPainter(),
//       ),
//     );
//   }
// }

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: const Color(0xff03569A),
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          child: CustomPaint(
            // size: const Size(500, 500),
            size: Size(MediaQuery.sizeOf(context).width,
                MediaQuery.sizeOf(context).height),
            painter: FlutterVideoPlayBackground(),
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: MediaQuery.sizeOf(context).width * 0.6,
                  child: ArrowWidget(
                      width: 50,
                      height: MediaQuery.sizeOf(context).height * 0.3),
                ),
                Positioned(
                  bottom: 0,
                  left: MediaQuery.sizeOf(context).width * 0.6,
                  child: Transform.flip(
                    flipY: true,
                    child: ArrowWidget(
                      height: MediaQuery.sizeOf(context).height * 0.1,
                      width: 35,
                      isShort: true,
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.sizeOf(context).height * 0.3,
                  right: 0,
                  child: Transform.rotate(
                    angle: math.pi / 2,
                    child: ArrowWidget(
                      width: 30,
                      height: MediaQuery.sizeOf(context).height * 0.1,
                      isShort: true,
                    ),
                  ),
                )
              ],
            ),
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

class FlutterVideoPlayBackground extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final whitePaint = Paint()..color = Colors.white;
    final redPaint = Paint()..color = Colors.red;
    final lightBluePaint = Paint()..color = const Color(0xff30CFFF);
    final lighterBluePaint = Paint()..color = const Color(0xff57A6CD);
    final deepBluePaint = Paint()..color = const Color(0xff03569A);
    final bluePaint = Paint()..color = const Color(0xff018DE6);
    final darkBluePaint = Paint()..color = const Color(0xff024C8B);

    //
    final arcRect = Offset(size.width * 0.8, 0) & size * 0.2;

    // final thing  = Rect.fro

    // final Path arcPath = Path()
    //   ..moveTo(size.width, 0)
    //   ..lineTo(size.width, size.height * 0.24)
    //   ..arcToPoint(Offset(size.width * 0.8, 0),
    //       radius: const Radius.circular(1))
    //   ..close();

    final Path arcPath = Path()
      ..moveTo(size.width, 0) // Start at the top-right corner
      ..lineTo(size.width, size.height * 0.2) // Draw a vertical line down
      ..quadraticBezierTo(
          size.width * 0.9, size.height * 0.2, size.width * 0.87, 0)
      ..close(); // Close the path

    //  blue background
    final backPath = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width * 0.2, 0)
      ..lineTo(size.width * 0.36, size.height * 0.2)
      ..lineTo(size.width * 0.05, size.height)
      ..lineTo(0, size.height)
      ..close();
    // white background
    final whiteBackPath = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width * 0.17, 0)
      ..lineTo(size.width * 0.4, size.height * 0.3)
      ..lineTo(size.width * 0.1, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(backPath, lightBluePaint);
    canvas.drawPath(whiteBackPath, whitePaint);
    canvas.drawPath(arcPath, lighterBluePaint);
    // canvas.drawRect(arcRect, redPaint);
    // canvas.drawArc(arcRect, 0, pi / 2, false, whitePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue // Set the line color
      ..strokeWidth = 1.0; // Adjust line thickness as needed

    canvas.drawLine(
        const Offset(0.0, 0.0), Offset(size.width * 0.4, size.height), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class RectanglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final dx = size.width;
    final dy = size.height;
    final center = Offset(dx / 2, dy / 2);
    final paint = Paint()
      ..color = Colors.orange // Set the line color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0; // Adjust line thickness as needed
    // const rect = Rect.fromLTWH(0, 0, 300, 200);
    final rect = Rect.fromCenter(center: center, width: 50.0, height: 50.0);

    final rect2 = Rect.fromCircle(center: center, radius: 50);
    final rect3 = Rect.fromLTRB(dx / 2, dy / 2, 60, 50);
    final rect4 = Rect.fromLTWH(dx / 2, dy / 2, 50, 50);
    final rect5 = Rect.fromPoints(center, const Offset(60, 50));

    canvas.drawRect(rect5, paint);
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

class ArrowWidget extends StatelessWidget {
  const ArrowWidget(
      {super.key,
      required this.height,
      required this.width,
      this.isShort = false});
  final double height;
  final double width;
  final bool isShort;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.amber,
      height: height,
      width: width,
      child: CustomPaint(
        painter: ArrowPainter(isShort: isShort),
      ),
    );
  }
}

class ArrowPainter extends CustomPainter {
  final bool isShort;
  ArrowPainter({
    required this.isShort,
  });
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xff57A6CD)
      ..style = PaintingStyle.fill;

    final x = size.width;
    final y = size.height;

    final path = Path();
    path.moveTo(x * 0.4, 0);
    path.lineTo(x * 0.6, 0);
    path.lineTo(x * 0.6, y * (isShort ? .6 : 0.8));
    path.lineTo(x, y * (isShort ? .6 : 0.8));
    path.lineTo(x * 0.5, y);
    path.lineTo(0, y * (isShort ? .6 : 0.8));
    path.lineTo(x * 0.4, y * (isShort ? .6 : 0.8));
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class QuadraticBezierCurvePainter extends CustomPainter {
  const QuadraticBezierCurvePainter();

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawPaint(Paint()..color = Colors.white);

    Path bezierPath = Path()
      ..moveTo(0, size.height)
      ..lineTo(0, size.height * 0.8)
      ..quadraticBezierTo(
        size.width / 2,
        size.height * 0.6,
        size.width,
        size.height * 0.8,
      )
      ..lineTo(size.width, size.height);

    final bezierPaint = Paint()
      ..shader =
          LinearGradient(colors: [Colors.purple[400]!, Colors.teal[400]!])
              .createShader(Offset(0, size.height * 0.8) & size);

    canvas.drawPath(bezierPath, bezierPaint);
  }

  @override
  bool shouldRepaint(QuadraticBezierCurvePainter oldDelegate) => false;
}

class StripedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint backgroundPaint = Paint()
      ..color = Colors.blue // Background color
      ..style = PaintingStyle.fill;

    // Draw the background
    canvas.drawRect(
        Rect.fromLTWH(0, 0, size.width, size.height), backgroundPaint);

    final Paint stripePaint = Paint()
      ..color = Colors.lightGreenAccent // Stripe color
      ..strokeWidth = 5.0; // Thickness of the stripes

    // Define spacing between stripes
    const double spacing = 20.0;

    // Draw diagonal stripes
    for (double i = -size.height; i < size.width; i += spacing) {
      canvas.drawLine(
        Offset(i, 0), // Start point
        Offset(i + size.height, size.height), // End point
        stripePaint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
