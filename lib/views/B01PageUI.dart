import 'package:flutter/material.dart';
import 'package:flutter_speed_ui_app/views/B02PageUI.dart';
import 'package:google_fonts/google_fonts.dart';

class B01pageui extends StatefulWidget {
  const B01pageui({super.key});

  @override
  State<B01pageui> createState() => _B01pageuiState();
}

class _B01pageuiState extends State<B01pageui> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          // ใช้ Stack เพื่อวางปุ่มย้อนกลับทับเลเยอร์อื่น
          children: [
            // 1. เนื้อหาหลักของหน้าจอ
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    const SizedBox(height: 60), // เว้นที่ว่างด้านบนให้ปุ่ม
                    // รูปภาพหลัก
                    Center(
                      child: Image.asset(
                        'assets/images/img11.png',
                        width: MediaQuery.of(context).size.width * 0.8,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 40),
                    // หัวข้อ
                    Text(
                      "Discover Your\nDream Job here",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1F41BB),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // ข้อความบรรยาย
                    Text(
                      "Explore all the existing job roles based on your interest and study major",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 70),
                    // แถวของปุ่ม Login และ Register
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const B02pageui(), // ตรวจสอบชื่อ Class หน้า B02 ให้ตรงกัน
                                ),
                              );
                              // Navigator.push(context, MaterialPageRoute(builder: (context) => const B02pageui()));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF1F41BB),
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 8,
                            ),
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Register",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),

            // 2. ปุ่มย้อนกลับ (Positioned ไว้ซ้ายบนสุด)
            Positioned(
              top: 40,
              left: 30,
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new,
                    color: Colors.black, size: 25),
                onPressed: () {
                  Navigator.pop(context); // กลับไปยังหน้าก่อนหน้า
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
