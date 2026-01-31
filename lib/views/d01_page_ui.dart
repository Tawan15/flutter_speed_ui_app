import 'package:flutter/material.dart';
import 'package:flutter_speed_ui_app/views/d02_page_ui.dart';
import 'package:flutter_speed_ui_app/views/d03_page_ui.dart';
import 'package:google_fonts/google_fonts.dart';

class D01PageUI extends StatefulWidget {
  const D01PageUI({super.key});

  @override
  State<D01PageUI> createState() => _D01PageUIState();
}

class _D01PageUIState extends State<D01PageUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 1. รูปพื้นหลังแบบเต็มจอ
          Positioned.fill(
            child: Image.asset(
              'assets/images/img5.png',
              fit: BoxFit.cover,
            ),
          ),

          // 2. ปุ่มย้อนกลับ (มุมซ้ายบนสุด)
          Positioned(
            top: 40,
            left: 20,
            child: InkWell(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: const EdgeInsets.all(12), // ปรับขนาดความกว้างของปุ่ม
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9), // สีพื้นหลังปุ่ม
                  borderRadius:
                      BorderRadius.circular(15), // ความมนของมุมสี่เหลี่ยม
                  border: Border.all(
                    color:
                        Colors.grey.withOpacity(0.2), // เส้นขอบบางๆ ให้ดูมีมิติ
                    width: 1,
                  ),
                ),
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  size: 20,
                  color: Color(0xFF212529), // สีของไอคอน
                ),
              ),
            ),
          ),
          // 3. เลเยอร์เนื้อหา (Content)
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 500),

                // ส่วนโลโก้
                Center(
                  child: Column(
                    children: [
                      Container(
                        width: 150,
                        height: 150,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: ClipRRect(
                          child: Image.asset(
                            'assets/images/img3.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                    ],
                  ),
                ),

                // 4. ส่วนปุ่มกด
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const D02PageUI()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF212529),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            "Login",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const D03PageUi()),
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            side:
                                const BorderSide(color: Colors.black, width: 2),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            "Register",
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Continue as a guest",
                          style: TextStyle(
                            color: Color(0xFF00CED1),
                            decoration: TextDecoration.underline,
                            decorationColor: Color(0xFF00CED1),
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
