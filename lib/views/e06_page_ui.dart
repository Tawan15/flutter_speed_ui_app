import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class E06PageUi extends StatefulWidget {
  const E06PageUi({super.key});

  @override
  State<E06PageUi> createState() => _E06PageUiState();
}

class _E06PageUiState extends State<E06PageUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. ส่วน Header รูปภาพ (เว้นไว้ใส่รูปส้มเหมือนเดิม)
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                    ),
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/img4.png'), // ใส่รูปส้มของคุณ
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 20,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.arrow_back_ios_new,
                          size: 20, color: Color(0xFFFF9124)),
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  Text(
                    "Create New Password",
                    style: GoogleFonts.poppins(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Enter new password",
                    style:
                        GoogleFonts.poppins(fontSize: 16, color: Colors.black),
                  ),
                  const SizedBox(height: 30),

                  // 3. ช่องกรอก New Password (แก้ไขให้เปลี่ยนสีตามสถานะ)
                  _buildAnimatedTextField("Enter New password"),

                  const SizedBox(height: 15),

                  // 4. ช่องกรอก Confirm Password (แก้ไขให้เปลี่ยนสีตามสถานะ)
                  _buildAnimatedTextField("Confirm password"),

                  const SizedBox(height: 40),

                  // 5. ปุ่ม Submit (Gradient)
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
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      child: Text(
                        "Submit",
                        style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ฟังก์ชันสร้าง TextField ที่เปลี่ยนสีขอบได้ตามสถานะ
  Widget _buildAnimatedTextField(String hint) {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: GoogleFonts.poppins(color: Colors.grey, fontSize: 14),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        // ขอบตอนที่ยังไม่ถูกคลิก (สีเดิม/เทาอ่อน)
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        // ขอบตอนที่คลิกใช้งาน (สีส้ม)
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Color(0xFFFF9124), width: 2),
        ),
      ),
    );
  }
}
