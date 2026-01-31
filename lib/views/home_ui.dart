import 'package:flutter/material.dart'; 
import 'package:flutter_speed_ui_app/views/%E0%B8%B4c01_page_ui.dart';
import 'package:flutter_speed_ui_app/views/a01_page_ui.dart';
import 'package:flutter_speed_ui_app/views/B01PageUI.dart';
import 'package:flutter_speed_ui_app/views/d01_page_ui.dart';
import 'package:flutter_speed_ui_app/views/e01_page_ui.dart';
import 'package:google_fonts/google_fonts.dart';

int currentIndexStatus = 1;

class HomeUi extends StatefulWidget {
  const HomeUi({super.key});

  @override
  State<HomeUi> createState() => _HomeUiState();
}

class _HomeUiState extends State<HomeUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF310055),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(50),
              child: Image.asset(
                'assets/images/img6.png',
                width: 250,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF792F1),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 0,
                ),
                onPressed: () {
                  // แก้ไขวงเล็บตรงนี้
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const A01PageUI()),
                  ); // ลบเซมิโคลอนออกถ้ายังมี Error แต่ปกติในปีกกาใส่ได้ครับ
                },
                child: const Text(
                  "Go to A Page",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(
                      255, 88, 119, 243), // เปลี่ยนรหัสสีที่นี่
                  foregroundColor: Colors.white, // สีตัวอักษร
                  minimumSize: const Size(100, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // ความมนของมุมปุ่ม
                  ),
                  elevation: 0, // ความเงาของปุ่ม (0 คือแบนราบแบบในรูป)
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const B01pageui()),
                  );
                  // ใส่คำสั่งเมื่อกดปุ่มตรงนี้
                },
                child: const Text(
                  "Go to B Page",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(
                      255, 101, 255, 140), // เปลี่ยนรหัสสีที่นี่
                  foregroundColor: Colors.white, // สีตัวอักษร
                  minimumSize: const Size(100, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // ความมนของมุมปุ่ม
                  ),
                  elevation: 0, // ความเงาของปุ่ม (0 คือแบนราบแบบในรูป)
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const C01PageUI())); // ใส่คำสั่งเมื่อกดปุ่มตรงนี้
                },
                child: const Text(
                  "Go to C Page",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(
                      255, 121, 235, 255), // เปลี่ยนรหัสสีที่นี่
                  foregroundColor: Colors.white, // สีตัวอักษร
                  minimumSize: const Size(100, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // ความมนของมุมปุ่ม
                  ),
                  elevation: 0, // ความเงาของปุ่ม (0 คือแบนราบแบบในรูป)
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const D01PageUI()),
                    );
                  // ใส่คำสั่งเมื่อกดปุ่มตรงนี้
                },
                child: const Text(
                  "Go to D Page",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(
                      255, 255, 186, 76), // เปลี่ยนรหัสสีที่นี่
                  foregroundColor: Colors.white, // สีตัวอักษร
                  minimumSize: const Size(100, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // ความมนของมุมปุ่ม
                  ),
                  elevation: 0, // ความเงาของปุ่ม (0 คือแบนราบแบบในรูป)
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const E01PageUI()),
                    );
                  // ใส่คำสั่งเมื่อกดปุ่มตรงนี้
                },
                child: const Text(
                  "Go to E Page",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
