import 'package:flutter/material.dart';
import 'package:flutter_speed_ui_app/views/c02_page_ui.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';

class C01PageUI extends StatefulWidget {
  const C01PageUI({super.key});

  @override
  State<C01PageUI> createState() => __C01PageUIState();
}

class __C01PageUIState extends State<C01PageUI> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const C02PageUi()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 1. พื้นหลังเต็มจอ
          Positioned.fill(
            child: Image.asset(
              'assets/images/img8.png',
              fit: BoxFit.cover,
            ),
          ),

          // 2. เนื้อหา (โลโก้ และ ข้อความ)
          SafeArea(
            child: Column(
              children: [
                // --- ปรับรูปตัว H ลงมาด้วยบรรทัดนี้ ---
                const SizedBox(
                    height: 300), // ปรับเลขนี้เพิ่มขึ้นเพื่อให้ตัว H ลงมาต่ำอีก

                // โลโก้ H พื้นขาวขอบมน
                Center(
                  child: Container(
                    width: 110,
                    height: 110,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/images/img10.png',
                        width: 70,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // ข้อความหัวข้อ
                Text(
                  "HOPE FOR",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 32,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "HUMANITY",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                // ใช้ Spacer เพื่อดันส่วน Welcome ลงไปด้านล่างสุดเหมือนในแบบ
                const Spacer(),

                // ข้อความ Welcome สีเขียวเข้มด้านล่าง
                Text(
                  "Welcome to\nhope for humanity",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF004D1A), // สีเขียวเข้มตามภาพต้นฉบับ
                  ),
                ),

                const SizedBox(height: 60), // ระยะห่างจากขอบล่างของจอ
              ],
            ),
          ),
        ],
      ),
    );
  }
}
