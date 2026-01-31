import 'package:flutter/material.dart';
import 'package:flutter_speed_ui_app/views/e02_page_ui.dart';
import 'package:google_fonts/google_fonts.dart';

class E01PageUI extends StatefulWidget {
  const E01PageUI({super.key});

  @override
  State<E01PageUI> createState() => _E01PageUIState();
}

class _E01PageUIState extends State<E01PageUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        // ใช้ Stack เพื่อให้ปุ่ม Back ลอยอยู่บนสุดซ้ายโดยไม่กระทบ Layout หลัก
        child: Stack(
          children: [
            // --- เนื้อหาหลักของหน้า ---
            Column(
              children: [
                const SizedBox(height: 10),
                // 1. ส่วนรูปภาพ
                Expanded(
                  flex: 6,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Image.asset(
                      'assets/images/img1.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                // 2. ส่วนข้อความ
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "BERRY JUICE",
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 40,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 2.0,
                            color: Colors.black,
                            shadows: [
                              Shadow(
                                color: const Color(0xFFFF9124).withOpacity(0.5),
                                offset: const Offset(0, 4),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "A \"Moments of healthy sip\nThe best vitamin for your health",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // 3. ปุ่ม Explore Now
                Padding(
                  padding: const EdgeInsets.fromLTRB(35, 0, 35, 100),
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                        colors: [Color(0xFFFFCC33), Color(0xFFFF9124)],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFFF9124).withOpacity(0.4),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const E02PageUi()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Explore Now",
                              style: GoogleFonts.poppins(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.white,
                              size: 28,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // --- ส่วนปุ่มย้อนกลับ (วางไว้บนสุดซ้าย) ---
            Positioned(
              top: 40, // ห่างจากขอบบน 40 ตามที่ต้องการ
              left: 20, // ห่างจากขอบซ้าย 20
              child: InkWell(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey[100], // พื้นหลังเทาอ่อนๆ ให้ดูมีมิติ
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.black,
                    size: 24,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
