import 'package:flutter/material.dart';
import 'package:flutter_speed_ui_app/views/c03_page_ui.dart';
import 'package:google_fonts/google_fonts.dart';

class C02PageUi extends StatefulWidget {
  const C02PageUi({super.key});

  @override
  State<C02PageUi> createState() => _C02PageUiState();
}

class _C02PageUiState extends State<C02PageUi> {
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
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              
              // 1. โลโก้พร้อมกรอบสีเขียว (แก้ไขให้เห็นขอบชัดเจน)
              Center(
                child: Container(
                  width: 100,
                  height: 100,
                  padding: const EdgeInsets.all(10), // เว้นระยะให้เห็นขอบ
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: const Color(0xFF00C853), // สีเขียวหลัก
                      width: 3.0,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/images/img10.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),

              // 2. หัวข้อ
              Text(
                "Sign in your account",
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),

              // 3. ช่องกรอกข้อมูล
              _buildInputLabel("Email"),
              _buildTextField("ex: jon.smith@email.com"),
              const SizedBox(height: 20),
              _buildInputLabel("Password"),
              _buildTextField("*********", isPassword: true),
              const SizedBox(height: 30),

              // 4. ปุ่ม SIGN IN
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00C853),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "SIGN IN",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 25),
              const Text("or sign in with", style: TextStyle(color: Colors.grey)),
              const SizedBox(height: 20),

              // 5. ปุ่ม Social (เปลี่ยนเป็นรูปภาพตามต้องการ)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _socialSquareButton('assets/images/google.png'), 
                  const SizedBox(width: 20),
                  _socialSquareButton('assets/images/facebook1.png'),
                  const SizedBox(width: 20),
                  _socialSquareButton('assets/images/twitter.png'),
                ],
              ),

              const SizedBox(height: 30),

              // 6. ส่วนท้าย
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context, MaterialPageRoute(builder: (context) => const C03PageUi()),
                      );
                    },
                    child: const Text(
                      "SIGN UP",
                      style: TextStyle(
                        color: Color(0xFF00C853),
                        fontWeight: FontWeight.bold,
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
    );
  }

  // ฟังก์ชันสร้างช่องกรอกข้อมูล
  Widget _buildTextField(String hint, {bool isPassword = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F8F8),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.black26),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        ),
      ),
    );
  }

  Widget _buildInputLabel(String label) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        label,
        style: const TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w500),
      ),
    );
  }

  // ฟังก์ชันสร้างปุ่ม Social ที่ใช้รูปภาพ (Image.asset)
  Widget _socialSquareButton(String imagePath) {
    return Container(
      height: 60,
      width: 80,
      decoration: BoxDecoration(
        color: const Color(0xFFF1F1F1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Image.asset(
          imagePath,
          width: 30,
          height: 30,
          fit: BoxFit.contain,
          // กรณีรูปไม่ขึ้น จะได้ไม่ error แรง ให้ใส่ errorBuilder ไว้
          errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image, color: Colors.grey),
        ),
      ),
    );
  }
}