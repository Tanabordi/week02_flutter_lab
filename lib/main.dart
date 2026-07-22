import 'package:flutter/material.dart';

// จุดเริ่มต้นของ App ทุกตัว
void main() {
  runApp(const MyApp());
}

// Root Widget ของแอป
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Week 02 Lab',
      // ปิด Banner "DEBUG" ที่มุมขวาบน
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

// หน้าแรก
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Week 02 Flutter Lab'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      // ✏️ ทดลอง C: แสดงทั้ง 4 ค่าของ MainAxisAlignment พร้อมกันในหน้าเดียว
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _AlignmentDemo(
              label: 'MainAxisAlignment.start',
              alignment: MainAxisAlignment.start,
            ),
            const SizedBox(height: 16),
            _AlignmentDemo(
              label: 'MainAxisAlignment.end',
              alignment: MainAxisAlignment.end,
            ),
            const SizedBox(height: 16),
            _AlignmentDemo(
              label: 'MainAxisAlignment.spaceBetween',
              alignment: MainAxisAlignment.spaceBetween,
            ),
            const SizedBox(height: 16),
            _AlignmentDemo(
              label: 'MainAxisAlignment.spaceEvenly',
              alignment: MainAxisAlignment.spaceEvenly,
            ),
          ],
        ),
      ),
    );
  }
}

// Helper Widget — แสดง Column + Row + Container พร้อม label บอกชื่อ alignment
class _AlignmentDemo extends StatelessWidget {
  final String label;
  final MainAxisAlignment alignment;

  const _AlignmentDemo({required this.label, required this.alignment});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label บอกชื่อ alignment
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: Colors.indigo,
          ),
        ),
        const SizedBox(height: 4),
        // กรอบ Container ที่มีความสูงคงที่ เพื่อให้เห็นความแตกต่างชัด
        Container(
          width: double.infinity,
          height: 220,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.indigo.shade200, width: 1.5),
            borderRadius: BorderRadius.circular(8),
            color: Colors.indigo.shade50,
          ),
          child: Column(
            mainAxisAlignment: alignment,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Container — กล่องที่ปรับแต่งได้
              Container(
                width: 160,
                height: 50,
                color: Colors.indigo.shade100,
                child: const Center(
                  child: Text('Container', style: TextStyle(fontSize: 14)),
                ),
              ),

              // Row — จัดเรียงแนวนอน
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: 50,
                      height: 50,
                      color: Colors.red.shade200,
                      child: const Center(child: Text('A'))),
                  const SizedBox(width: 6),
                  Container(
                      width: 50,
                      height: 50,
                      color: Colors.green.shade200,
                      child: const Center(child: Text('B'))),
                  const SizedBox(width: 6),
                  Container(
                      width: 50,
                      height: 50,
                      color: Colors.blue.shade200,
                      child: const Center(child: Text('C'))),
                  const SizedBox(width: 6),
                  // ✏️ ทดลอง D: Container D สีม่วง ขนาด 80×80
                  Container(
                      width: 50,
                      height: 50,
                      color: Colors.purple.shade200,
                      child: const Center(child: Text('D'))),
                ],
              ),

              const Text(
                'Column + Row + Container',
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
      ],
    );
  }
}