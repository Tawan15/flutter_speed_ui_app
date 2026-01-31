import 'package:flutter/material.dart';
import 'package:flutter_speed_ui_app/views/d06_page_ui.dart';
import 'package:google_fonts/google_fonts.dart';

class D05PageUI extends StatefulWidget {
  const D05PageUI({super.key});

  @override
  State<D05PageUI> createState() => _D05PageUIState();
}

class _D05PageUIState extends State<D05PageUI> {
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
              _backButton(context),

              const SizedBox(height: 30),

              // 2. หัวข้อ OTP Verification
              Text(
                "OTP Verification",
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1E232C),
                ),
              ),
              
              const SizedBox(height: 10),

              // 3. คำอธิบาย
              Text(
                "Enter the verification code we just sent on your email address.",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: const Color(0xFF8391A1),
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 30),

              // 4. ช่องกรอก OTP 4 ช่อง
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _otpTextField(context, first: true, last: false),
                  const SizedBox(width: 15,),
                  _otpTextField(context, first: false, last: false),
                  const SizedBox(width: 15,),
                  _otpTextField(context, first: false, last: false),
                  const SizedBox(width: 15,),
                  _otpTextField(context, first: false, last: true),
                ],
              ),

              const SizedBox(height: 30),

              // 5. ปุ่ม Verify
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const D06PageUI()),
                    );
                    // ตรวจสอบรหัส OTP
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1E232C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Verify",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget สำหรับช่องกรอก OTP แต่ละช่อง
  Widget _otpTextField(BuildContext context, {required bool first, last}) {
    return SizedBox(
      height: 70,
      width: 70,
      child: TextField(
        autofocus: true,
        onChanged: (value) {
          if (value.length == 1 && last == false) {
            FocusScope.of(context).nextFocus(); // พิมพ์เสร็จแล้วไปช่องถัดไป
          }
          if (value.isEmpty && first == false) {
            FocusScope.of(context).previousFocus(); // ลบแล้วย้อนกลับไปช่องก่อนหน้า
          }
        },
        showCursor: false,
        readOnly: false,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: InputDecoration(
          counterText: "",
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
      ),
    );
  }

  Widget _backButton(BuildContext context) {
    return InkWell(
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
    );
  }
}