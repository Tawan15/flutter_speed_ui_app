import 'package:flutter/material.dart';
import 'package:flutter_speed_ui_app/views/a01_page_ui.dart';
import 'package:google_fonts/google_fonts.dart';

class A02PageUi extends StatefulWidget {
  const A02PageUi({super.key});

  @override
  State<A02PageUi> createState() => _A02PageUiState();
}

class _A02PageUiState extends State<A02PageUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Column(
            children: [
              const SizedBox(height: 20),
              // 1. หัวข้อ Welcome Back
              Text(
                "Welcome Back",
                style: GoogleFonts.poppins(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF333333),
                ),
              ),
              const SizedBox(height: 15),
              // 2. คำบรรยาย
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Diam maecenas mi non sed ut odio. Non, justo, sed facilisi et.",
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: Colors.grey[600],
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 40),

              // 3. ช่องกรอกข้อมูล (Background เทาอ่อน มนรอบ)
              _buildInput("Username , Email & Phone Number"),
              const SizedBox(height: 20),
              _buildInput("Password", isPassword: true),
              
              // 4. Forgot Password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot Password ?",
                    style: GoogleFonts.inter(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // 5. ปุ่ม Sign in (สีชมพู มนกว้าง)
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF792F1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 5,
                    shadowColor: const Color(0xFFF792F1).withOpacity(0.5),
                  ),
                  child: const Text(
                    "Sign in",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),

              // 6. ส่วน Or Sign up With (เส้นกั้น)
              Row(
                children: [
                  const Expanded(child: _GradientDivider()),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Or Sign up With",
                      style: GoogleFonts.inter(fontSize: 12, color: Colors.grey[700]),
                    ),
                  ),
                  const Expanded(child: _GradientDivider(reverse: true)),
                ],
              ),
              const SizedBox(height: 40),

              // 7. ปุ่ม Social แบบวงกลม (ตามรูป)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _circleSocial('assets/images/google.png'),
                  const SizedBox(width: 20),
                  _circleSocial('assets/images/facebook2.png'),
                  const SizedBox(width: 20),
                  _circleSocial('assets/images/apple.png'),
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  // Widget สำหรับช่อง Input
  Widget _buildInput(String hint, {bool isPassword = false}) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF3F3F3), // สีเทาอ่อนตามรูป
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.grey),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        ),
      ),
    );
  }

  // Widget สำหรับปุ่มวงกลมด้านล่าง
  Widget _circleSocial(String imgPath) {
    return Container(
      padding: const EdgeInsets.all(12),
      height: 65,
      width: 65,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFFF3F3F3), // พื้นหลังวงกลมเทาอ่อน
        border: Border.all(color: Colors.pink.shade50), // ขอบชมพูจางๆ
      ),
      child: Image.asset(imgPath, fit: BoxFit.contain),
    );
  }
}

// Widget สำหรับทำเส้นกั้นไล่เฉดสี
class _GradientDivider extends StatelessWidget {
  final bool reverse;
  const _GradientDivider({this.reverse = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.5,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: reverse 
            ? [Colors.pink.shade200, Colors.white] 
            : [Colors.white, Colors.pink.shade200],
        ),
      ),
    );
  }
}