import 'package:flutter/material.dart';
import 'package:flutter_speed_ui_app/views/B02PageUI.dart';
import 'package:google_fonts/google_fonts.dart';

class B03pageui extends StatefulWidget {
  const B03pageui({super.key});

  @override
  State<B03pageui> createState() => _B03pageuiState();
}

class _B03pageuiState extends State<B03pageui> {
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
                "Create Account",
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              const SizedBox(height: 10),
              // 2. คำบรรยาย
              Text(
                "Create an account so you can explore all the existing jobs",
                textAlign: TextAlign.center,
                style: GoogleFonts.kanit(
                  fontSize: 18,
                  color: Colors.black,
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 40),

              // 3. ช่องกรอกข้อมูล (Background เทาอ่อน มนรอบ)
              _buildInput("Email"),
              const SizedBox(height: 20),
              _buildInput("Password", isPassword: true),
              const SizedBox(height: 20),
              _buildInput("Confirm Password", isPassword: true),
              const SizedBox(height: 20),
              // 4. Forgot Password
              const SizedBox(height: 20),

              // 5. ปุ่ม Sign in (สีชมพู มนกว้าง)
              SizedBox(
                width: double.infinity,
                height: 70,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 10,
                    shadowColor: Colors.blueAccent,
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
              const SizedBox(height: 40),

              Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const B02pageui()),
                    );
                    // ใส่คำสั่งเมื่อกดปุ่มตรงนี้
                  },
                  child: Text(
                    "Already have an account",
                    style: GoogleFonts.inter(
                      color: const Color.fromARGB(255, 86, 86, 86),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 60),
              Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Or continue with",
                    style: GoogleFonts.inter(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
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
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
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
