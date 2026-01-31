import 'package:flutter/material.dart';
import 'package:flutter_speed_ui_app/views/d03_page_ui.dart';
import 'package:flutter_speed_ui_app/views/d04_page_ui.dart';
import 'package:flutter_speed_ui_app/views/home_ui.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/gestures.dart';

class D02PageUI extends StatefulWidget {
  const D02PageUI({super.key});

  @override
  State<D02PageUI> createState() => _D02PageUIState();
}

class _D02PageUIState extends State<D02PageUI> {
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
              // 1. ปุ่มย้อนกลับ
              InkWell(
                onTap: () {
                  // ใช้ pushAndRemoveUntil เพื่อย้อนกลับไปหน้า Home และล้างหน้าอื่นทิ้งทั้งหมด
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const HomeUi(), // เปลี่ยนชื่อเป็นคลาสหน้า Home ของคุณ
                    ),
                    (route) => false, // ล้าง stack หน้าก่อนหน้าทั้งหมด
                  );
                },
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
              Text(
                "Welcome back! Glad\nto see you, Again!",
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1E232C),
                ),
              ),

              const SizedBox(height: 30),

              _buildTextField("Enter your email",
                  hintColor: const Color(0xFF8391A1)),
              const SizedBox(height: 15),
              _buildTextField("Enter your password",
                  isPassword: true, hintColor: const Color(0xFF8391A1)),
              // ---------------------------------------
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const D04PageUI()),
                    );
                  },
                  child: Text(
                    "Forgot Password?",
                    style: GoogleFonts.poppins(color: const Color(0xFF6A707C)),
                  ),
                ),
              ),

              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1E232C),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  child: const Text("Login",
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                ),
              ),

              const SizedBox(height: 35),
              Row(
                children: [
                  Expanded(child: Divider(color: Colors.grey.shade300)),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text("Or Login with",
                        style: TextStyle(color: Colors.grey)),
                  ),
                  Expanded(child: Divider(color: Colors.grey.shade300)),
                ],
              ),

              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _socialButton('assets/images/facebook1.png'),
                  const SizedBox(width: 15),
                  _socialButton('assets/images/google.png'),
                  const SizedBox(width: 15),
                  _socialButton('assets/images/apple.png'),
                ],
              ),

              SizedBox(
                height: 300,
              ),
              Center(
                child: RichText(
                  text: TextSpan(
                    style: GoogleFonts.poppins(
                        color: const Color(0xFF1E232C), fontSize: 16),
                    children: [
                      const TextSpan(text: "Don't have an account? "),
                      TextSpan(
                        text: "Register Now",
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF35C2C1),
                          fontWeight: FontWeight.bold,
                        ),
                        // เพิ่มส่วนนี้เพื่อให้กดได้
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // สั่งให้เปิดไปหน้า D03
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const D03PageUi()),
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

  Widget _socialButton(String imagePath) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 90,
        height: 60,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade200),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Image.asset(imagePath,
              width: 30, height: 30, fit: BoxFit.contain),
        ),
      ),
    );
  }

  // แก้ไขฟังก์ชันนี้เพื่อรองรับการเปลี่ยนสี Hint
  Widget _buildTextField(String hint,
      {bool isPassword = false, Color hintColor = Colors.grey}) {
    return TextField(
      obscureText: isPassword,
      // สีของตัวอักษรตอนเราพิมพ์
      style: GoogleFonts.poppins(color: const Color(0xFF1E232C)),
      decoration: InputDecoration(
        hintText: hint,
        // เปลี่ยนสีฟอนต์คำใบ้ที่นี่
        hintStyle: GoogleFonts.poppins(color: hintColor),
        fillColor: const Color(0xFFF7F8F9),
        filled: true,
        suffixIcon: isPassword
            ? const Icon(Icons.visibility_outlined, color: Color(0xFF8391A1))
            : null,
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
