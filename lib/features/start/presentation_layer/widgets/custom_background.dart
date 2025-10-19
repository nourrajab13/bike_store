import 'package:bikestore/core/const/app_colors.dart';
import 'package:flutter/material.dart';

class RPSCustomPainterbg extends CustomPainter{
  
  @override
  void paint(Canvas canvas, Size size) {
    
    

  // Layer 1
  
  Paint paintFill0 = Paint()
      ..color = AppColors.firstColor
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width*0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;
     
         
    Path path_0 = Path();
    path_0.moveTo(0,size.height*0.0020000);
    path_0.lineTo(size.width*0.9987500,0);
    path_0.lineTo(size.width*0.9987500,size.height*0.8960000);
    path_0.lineTo(0,size.height*0.9980000);
    path_0.lineTo(0,size.height*0.0020000);
    path_0.close();

    canvas.drawPath(path_0, paintFill0);
  

  // Layer 1
  
  Paint paintStroke0 = Paint()
      ..color = AppColors.firstColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width*0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;
     
         
    
    canvas.drawPath(path_0, paintStroke0);
  
    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}
