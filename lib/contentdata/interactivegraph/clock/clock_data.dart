import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:async';

class AnimatedClockWidget extends StatefulWidget {
  final double? width;
  final double? height;
  final bool showRealTime;
  
  const AnimatedClockWidget({
    Key? key,
    this.width,
    this.height,
    this.showRealTime = false, // false = แสดง 10:25, true = แสดงเวลาจริง
  }) : super(key: key);

  @override
  State<AnimatedClockWidget> createState() => _AnimatedClockWidgetState();
}

class _AnimatedClockWidgetState extends State<AnimatedClockWidget>
    with TickerProviderStateMixin {
  late AnimationController _lightStripController;
  late AnimationController _blinkController;
  late Animation<double> _lightStripAnimation;
  late Animation<double> _blinkAnimation;
  
  Timer? _timeTimer;
  String _currentTime = "10:25";
  
  @override
  void initState() {
    super.initState();
    
    // Light strip animation (4 วินาที)
    _lightStripController = AnimationController(
      duration: Duration(seconds: 4),
      vsync: this,
    )..repeat();
    
    // Animation ที่จำลอง keyTimes="0; 0.25; 1" จาก SVG
    _lightStripAnimation = Tween<double>(
      begin: -0.25, // เริ่มนอกจอซ้าย
      end: 1.25,    // จบนอกจอขวา
    ).animate(CurvedAnimation(
      parent: _lightStripController,
      curve: Interval(0.0, 0.25, curve: Curves.easeInOut), // เคลื่อนที่แค่ 25% แรก
    ));
    
    // Colon blink animation (2 วินาที)
    _blinkController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    )..repeat();
    
    _blinkAnimation = Tween<double>(
      begin: 1.0,
      end: 0.3,
    ).animate(CurvedAnimation(
      parent: _blinkController,
      curve: Interval(0.5, 1.0, curve: Curves.easeInOut), // กระพริบช่วง 50%-100%
    ));
    
    // Real time timer (ถ้าต้องการ)
    if (widget.showRealTime) {
      _updateTime();
      _timeTimer = Timer.periodic(Duration(seconds: 1), (timer) {
        _updateTime();
      });
    }
  }
  
  void _updateTime() {
    final now = DateTime.now();
    setState(() {
      _currentTime = "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}";
    });
  }
  
  @override
  void dispose() {
    _lightStripController.dispose();
    _blinkController.dispose();
  _timeTimer?.cancel();
  super.dispose();
}

@override
Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? 400,
      height: widget.height ?? 200,
      child: Stack(
        children: [
          // 1. SVG Background (ใช้ string หรือไฟล์ assets/clock.svg)
          _buildSvgBackground(),
          
          // 2. Moving Light Strip
          AnimatedBuilder(
            animation: _lightStripAnimation,
            builder: (context, child) {
              return _buildLightStrip();
            },
          ),
          
          // 3. Glowing Time Text with Blinking Colon
          AnimatedBuilder(
            animation: _blinkAnimation,
            builder: (context, child) {
              return _buildGlowingTimeText();
            },
          ),
        ],
      ),
    );
  }
  
  Widget _buildSvgBackground() {
return SvgPicture.asset(
  'assets/clock.svg',
  width: widget.width ?? 400,
  height: widget.height ?? 200,
  fit: BoxFit.contain,
);
  }
  
  Widget _buildLightStrip() {
    return Positioned.fill(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20), // ตรงกับ SVG rx="40"
        child: CustomPaint(
          painter: _LightStripPainter(
            position: _lightStripAnimation.value,
          ),
          size: Size(widget.width ?? 400, widget.height ?? 200),
        ),
      ),
    );
  }
  
  Widget _buildGlowingTimeText() {
    // แยกชั่วโมงและนาที
    List<String> timeParts = _currentTime.split(':');
    String hourPart = timeParts[0];
    String minutePart = timeParts.length > 1 ? timeParts[1] : "00";
    
    return Positioned.fill(
      child: Center(
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              // ชั่วโมง
              TextSpan(
                text: hourPart,
                style: _getGlowingTextStyle(),
              ),
              // เครื่องหมาย : (กระพริบ)
              TextSpan(
                text: ":",
                style: _getGlowingTextStyle().copyWith(
                  color: Color(0xFFFF5500).withOpacity(_blinkAnimation.value),
                  shadows: _blinkAnimation.value > 0.5 ? _getGlowShadows() : null,
                ),
              ),
              // นาที
              TextSpan(
                text: minutePart,
                style: _getGlowingTextStyle(),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  TextStyle _getGlowingTextStyle() {
    final size = widget.height ?? 200;
    return TextStyle(
      fontSize: size * 0.375, // ปรับขนาดตาม container
      fontWeight: FontWeight.w600,
      color: Color(0xFFFF5500),
      fontFamily: 'monospace', // หรือใช้ Google Fonts Orbitron
      shadows: _getGlowShadows(),
    );
  }
  
  List<Shadow> _getGlowShadows() {
    return [
      // Inner glow
      Shadow(
        color: Color(0xFFFF5500).withOpacity(0.8),
        blurRadius: 10,
        offset: Offset(0, 0),
      ),
      // Outer glow
      Shadow(
        color: Color(0xFFFF5500).withOpacity(0.6),
        blurRadius: 20,
        offset: Offset(0, 0),
      ),
      // Far glow
      Shadow(
        color: Color(0xFFFF5500).withOpacity(0.3),
        blurRadius: 30,
        offset: Offset(0, 0),
      ),
    ];
  }
}

class _LightStripPainter extends CustomPainter {
  final double position;
  
  _LightStripPainter({required this.position});
  
  @override
  void paint(Canvas canvas, Size size) {
    if (position < 0 || position > 1) return; // ไม่แสดงเมื่ออยู่นอกจอ
    
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.2 * 0.7) // ตรงกับ SVG opacity
      ..style = PaintingStyle.fill;
    
    // คำนวณตำแหน่ง (จำลอง values="-200 0; 1000 0; 1000 0")
    final stripX = size.width * position;
    final stripWidth = size.width * 0.125; // ความกว้างแถบแสง
    
    // สร้าง diagonal strip ตาม SVG path
    final path = Path();
    path.moveTo(stripX - stripWidth, 0);                    // M -100 0
    path.lineTo(stripX - stripWidth * 0.5, 0);              // L -50 0  
    path.lineTo(stripX + stripWidth * 0.5, size.height);    // L 50 400
    path.lineTo(stripX, size.height);                       // L 0 400
    path.close();                                           // Z
    
    canvas.drawPath(path, paint);
  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

// Widget สำหรับใช้ในระบบของคุณ
class ClockData {
  static Widget getClockWidget() {
    return AnimatedClockWidget(
      width: 300,
      height: 150,
      showRealTime: false, // แสดง 10:25
    );
  }
  
  static Widget getRealTimeClockWidget() {
    return AnimatedClockWidget(
      width: 300,
      height: 150,
      showRealTime: true, // แสดงเวลาจริง
    );
  }
}
// ตัวอย่างการใช้งาน
class ClockExampleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Animated Clock with SVG'),
        backgroundColor: Colors.grey[800],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // นาฬิกาแสดง 10:25
            Column(
              children: [
                Text(
                  'Fixed Time (10:25) - SVG + Animation',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                SizedBox(height: 20),
                AnimatedClockWidget(
                  width: 400,
                  height: 200,
                  showRealTime: false,
                ),
              ],
            ),
            
            // นาฬิกาแสดงเวลาจริง
            Column(
              children: [
                Text(
                  'Real Time Clock',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                SizedBox(height: 20),
                AnimatedClockWidget(
                  width: 400,
                  height: 200,
                  showRealTime: true,
                ),
              ],
            ),
            
            // นาฬิกาขนาดเล็ก
            Column(
              children: [
                Text(
                  'Small Size',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                SizedBox(height: 20),
                AnimatedClockWidget(
                  width: 200,
                  height: 100,
                  showRealTime: false,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}