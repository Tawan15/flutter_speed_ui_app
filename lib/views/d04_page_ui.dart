import 'package:flutter/material.dart';
import 'package:flutter_speed_ui_app/views/d02_page_ui.dart';
import 'package:flutter_speed_ui_app/views/d05_page_ui.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/gestures.dart';

class D04PageUI extends StatefulWidget {
  const D04PageUI({super.key});

  @override
  State<D04PageUI> createState() => _D04PageUIState();
}

class _D04PageUIState extends State<D04PageUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              // 1. ปุ่มย้อนกลับทรงสี่เหลี่ยมมน
              InkWell(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: const Icon(Icons.arrow_back_ios_new, size: 20),
                ),
              ),

              const SizedBox(height: 30),

              // 2. หัวข้อ Forgot Password?
              Text(
                "Forgot Password?",
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1E232C),
                ),
              ),

              const SizedBox(height: 10),

              // 3. คำอธิบายสีเทา
              Text(
                "Don't worry! It occurs. Please enter the email address linked with your account.",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: const Color(0xFF8391A1),
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 30),

              // 4. ช่องกรอก Email
              _buildTextField("Enter your email",
                  hintColor: const Color(0xFF8391A1)),

              const SizedBox(height: 30),

              // 5. ปุ่ม Send Code สีเข้ม
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const D05PageUI()),
                    );
                    // จัดการส่งรหัสที่นี่
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1E232C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Send Code",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),

              const SizedBox(height: 500), // เว้นระยะให้ข้อความด้านล่าง

              // 6. ข้อความกลับไปหน้า Login
              // 6. ข้อความกลับไปหน้า Login
              Center(
                child: RichText(
                  text: TextSpan(
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF1E232C),
                      fontSize: 15,
                    ),
                    children: [
                      // ส่วนนี้จะกลายเป็นข้อความธรรมดา กดไม่ได้
                      const TextSpan(text: "Remember Password? "),

                      // ส่วนนี้เท่านั้นที่กดได้
                      TextSpan(
                        text: "Login",
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF35C2C1),
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const D02PageUI()),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ใช้ฟังก์ชันเดิมจากหน้าก่อนหน้าเพื่อความเป็นระเบียบ
  Widget _buildTextField(String hint, {Color hintColor = Colors.grey}) {
    return TextField(
      style: GoogleFonts.poppins(color: const Color(0xFF1E232C)),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: GoogleFonts.poppins(color: hintColor),
        fillColor: const Color(0xFFF7F8F9),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFFE8ECF4)),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFF35C2C1)),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
