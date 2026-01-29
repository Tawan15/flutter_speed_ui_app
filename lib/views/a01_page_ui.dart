import 'package:flutter/material.dart';
import 'package:flutter_speed_ui_app/views/a02_page_ui.dart';
import 'package:google_fonts/google_fonts.dart';

class A01PageUI extends StatefulWidget {
  const A01PageUI({super.key});

  @override
  State<A01PageUI> createState() => _A01PageUIState();
}

class _A01PageUIState extends State<A01PageUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // --- 1. ส่วนหัว: รูปภาพ + ปุ่มย้อนกลับ (ใช้ Stack) ---
          Stack(
            children: [
              // รูปภาพสีชมพู มนขอบล่าง
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(80),
                  bottomRight: Radius.circular(80),
                ),
                child: Container(
                  // --- เพิ่มบรรทัดนี้เพื่อเว้นขอบจอ ---
                  margin:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  // ----------------------------
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.55,
                  color: const Color(0xFFF792F1),
                  child: Center(
                    child: Image.asset(
                      'assets/images/img7.png',
                      width: 320,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),

              // ปุ่มย้อนกลับ ซ้ายบนสุด
              Positioned(
                top: 15, // ปรับให้พ้นแถบ Status bar
                left: 15,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new,
                      color: Colors.white, size: 30),
                  onPressed: () {
                    Navigator.pop(context); // ใช้ได้จริง: กลับไปหน้าก่อนหน้า
                  },
                ),
              ),
            ],
          ),

          const SizedBox(height: 35),

          // --- 2. หัวข้อภาษาอังกฤษ ---
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              "Discover Your\nOwn Dream House",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF333333),
                height: 1.2,
              ),
            ),
          ),

          const SizedBox(height: 15),

          // --- 3. ข้อความบรรยาย ---
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Diam maecenas mi non sed ut odio. Non, justo, sed facilisi et. Eget viverra urna, vestibulum egestas faucibus egestas.",
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 14,
                color: Colors.grey[600],
                height: 1.5,
              ),
            ),
          ),

          const Spacer(), // ดันปุ่มไปไว้ด้านล่างสุดของจอ

          // --- 4. ส่วนของปุ่ม Sign in / Register ที่ติดกัน ---
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                color: const Color(0xFFF3F3F3),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // ปุ่ม Sign in (สีชมพู มนด้านซ้าย)
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        // เพิ่มคำสั่งกดปุ่มที่นี่
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          color: Color(0xFFF792F1),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                          ),
                        ),
                        child: const Text(
                          "Sign in",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // ปุ่ม Register (มนด้านขวา)
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const A02PageUi()),
                        );
                        // เพิ่มคำสั่งกดปุ่มที่นี่
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: const Text(
                          "Register",
                          style: TextStyle(
                            color: Color(0xFF4A4A4A),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
