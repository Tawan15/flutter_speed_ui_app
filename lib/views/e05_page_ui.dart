import 'package:flutter/material.dart';
import 'package:flutter_speed_ui_app/views/e06_page_ui.dart';
import 'package:google_fonts/google_fonts.dart';

class E05PageUi extends StatefulWidget {
  const E05PageUi({super.key});

  @override
  State<E05PageUi> createState() => _E05PageUiState();
}

class _E05PageUiState extends State<E05PageUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        // ใช้ SafeArea เพื่อไม่ให้ปุ่มไปทับ Status bar
        child: Stack(
          children: [
            // 1. ส่วนเนื้อหาหลักที่เลื่อนได้
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    const SizedBox(
                        height: 120), // เว้นที่ไว้ให้ส่วนหัวที่ใช้ Positioned

                    // ส่วนรูปประกอบ
                    Container(
                      height: 280,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/img2.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),

                    const SizedBox(height: 40),

                    // หัวข้อ Enter OTP
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Enter OTP",
                            style: GoogleFonts.poppins(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "An 4 digit code has been sent to your email",
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),

                    // ช่อง OTP 4 ช่อง
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildOTPBox(),
                        const SizedBox(width: 15,),
                        _buildOTPBox(),
                        const SizedBox(width: 15,),
                        _buildOTPBox(),
                        const SizedBox(width: 15,),
                        _buildOTPBox(),
                      ],
                    ),

                    const SizedBox(height: 30),

                    // Countdown Text
                    RichText(
                      text: TextSpan(
                        style: GoogleFonts.poppins(
                            color: Colors.black, fontSize: 14),
                        children: [
                          const TextSpan(
                              text: "You should recieve the OTP in "),
                          TextSpan(
                            text: "30 Second",
                            style: GoogleFonts.poppins(
                              color: const Color(0xFFFF9124),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 40),

                    // ปุ่ม Verify
                    Container(
                      width: double.infinity,
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: const LinearGradient(
                          colors: [Color(0xFFFFCC33), Color(0xFFFF9124)],
                        ),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const E06PageUi()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                        child: Text(
                          "Verify",
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // 2. ส่วนหัว (Bar) ที่ใช้ Positioned กำหนดความสูง 40 ตามสั่ง
            Positioned(
              top: 40,
              left: 20,
              right: 20,
              height: 40, // กำหนดความสูง Bar เป็น 40 ตามต้องการ
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // ปุ่มย้อนกลับ Positioned (ใช้งานได้จริง)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                          color: Color(0xFFFFF9C4),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          size: 16,
                          color: Color(0xFFFF9124),
                        ),
                      ),
                    ),
                  ),
                  // หัวข้อ OTP Verification กลางหน้าจอ
                  Text(
                    "OTP Verification",
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOTPBox() {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.bold),
        decoration: const InputDecoration(
          counterText: "",
          border: InputBorder.none,
        ),
      ),
    );
  }
}
