import '../../ui/content_models.dart';

final List<Topic> mainCatalog = [
  // 1. เซต (Sets)
  Topic(
    title: "เซต",
    lessons: [
      LessonSummary(
        id: "set_basics",
        title: "เซตและการดำเนินการ",
        subtopics: [
          SubLesson(id: "set_intro", title: "แนะนำเซต"),
          SubLesson(id: "set_operations", title: "การดำเนินการเซต"),
          SubLesson(id: "set_venn", title: "แผนภาพเวนน์"),
        ],
      ),
    ],
  ),

  // 2. ตรรกศาสตร์เบื้องต้น (Logic)
  Topic(
    title: "ตรรกศาสตร์เบื้องต้น",
    lessons: [
      LessonSummary(
        id: "logic_basics",
        title: "ตรรกศาสตร์",
        subtopics: [
          SubLesson(id: "logic_intro", title: "ประพจน์และตรรกศาสตร์"),
          SubLesson(id: "logic_operators", title: "ตัวดำเนินการทางตรรกะ"),
          SubLesson(id: "logic_truth_table", title: "ตารางค่าความจริง"),
        ],
      ),
    ],
  ),

  // 3. ระบบจำนวนจริง (Real Number System)
  Topic(
    title: "ระบบจำนวนจริง",
    lessons: [
      LessonSummary(
        id: "real_basics",
        title: "จำนวนจริงเบื้องต้น",
        subtopics: [
          SubLesson(id: "real_intro", title: "ระบบจำนวนจริง"),
          SubLesson(id: "real_properties", title: "สมบัติของจำนวนจริง"),
          SubLesson(id: "real_inequalities", title: "อสมการ"),
        ],
      ),
    ],
  ),

  // 4. ระบบสมการเชิงเส้นและเมทริกซ์
  Topic(
    title: "ระบบสมการเชิงเส้นและเมทริกซ์",
    lessons: [
      LessonSummary(
        id: "matrix_all",
        title: "เมทริกซ์",
        subtopics: [
          // Group 1: พื้นฐานเมทริกซ์
          SubLesson(title: "พื้นฐานเมทริกซ์", isGroupHeader: true),
          SubLesson(id: "matrix_basics", title: "พื้นฐานและการบวกลบเมทริกซ์"),
          SubLesson(id: "matrix_multiplication", title: "การคูณเมทริกซ์"),
          SubLesson(id: "matrix_types", title: "ชนิดเมทริกซ์"),
          SubLesson(id: "matrix_identity", title: "การประยุกต์เมทริกซ์เอกลักษณ์"),

          // Group 2: การดำเนินการ
          SubLesson(title: "การดำเนินการ", isGroupHeader: true),
          SubLesson(id: "matrix_transpose", title: "การทรานสโพส"),
          SubLesson(id: "matrix_det", title: "การ Det"),
          SubLesson(id: "matrix_adj_inverse", title: "แอดจอยซ์และอินเวอร์ส"),

          // Group 3: สมบัติและโจทย์เพิ่มเติม
          SubLesson(title: "สมบัติและโจทย์เพิ่มเติม", isGroupHeader: true),
          SubLesson(id: "matrix_prop_mult", title: "สมบัติการบวกและคูณ"),
          SubLesson(id: "matrix_prop_ops", title: "สมบัติการดำเนินการ"),
          SubLesson(id: "matrix_prop_det", title: "สมบัติการ det"),
        ],
      ),
    ],
  ),

  // 5. ความสัมพันธ์และฟังก์ชัน
  Topic(
    title: "ความสัมพันธ์และฟังก์ชัน",
    lessons: [
      LessonSummary(
        id: "function_basics",
        title: "ฟังก์ชันและความสัมพันธ์",
        subtopics: [
          SubLesson(id: "function_intro", title: "แนะนำฟังก์ชัน"),
          SubLesson(id: "function_types", title: "ประเภทของฟังก์ชัน"),
          SubLesson(id: "function_composition", title: "ฟังก์ชันประกอบ"),
          SubLesson(id: "function_inverse", title: "ฟังก์ชันผกผัน"),
        ],
      ),
    ],
  ),

  // 6. เรขาคณิตวิเคราะห์
  Topic(
    title: "เรขาคณิตวิเคราะห์",
    lessons: [
      LessonSummary(
        id: "geometry_basics",
        title: "เรขาคณิตวิเคราะห์เบื้องต้น",
        subtopics: [
          SubLesson(id: "geometry_coordinate", title: "ระบบพิกัด"),
          SubLesson(id: "geometry_distance", title: "ระยะทางและจุดกึ่งกลาง"),
          SubLesson(id: "geometry_lines", title: "เส้นตรง"),
        ],
      ),
      LessonSummary(
        id: "geometry_conic",
        title: "ภาคตัดกรวย",
        subtopics: [
          SubLesson(id: "geometry_circle", title: "วงกลม"),
          SubLesson(id: "geometry_parabola", title: "พาราโบลา"),
          SubLesson(id: "geometry_ellipse", title: "วงรี"),
          SubLesson(id: "geometry_hyperbola", title: "ไฮเพอร์โบลา"),
        ],
      ),
    ],
  ),

  // 7. ฟังก์ชัน Exponential และ Logarithm
  Topic(
    title: "ฟังก์ชัน Exponential และฟังก์ชัน Logarithm",
    lessons: [
      LessonSummary(
        id: "expo_basics",
        title: "เลขยกกำลังและลอการิทึม",
        subtopics: [
          SubLesson(id: "expo_intro", title: "ฟังก์ชันเอ็กซ์โพเนนเชียล"),
          SubLesson(id: "expo_properties", title: "สมบัติเลขยกกำลัง"),
          SubLesson(id: "expo_log_intro", title: "ฟังก์ชันลอการิทึม"),
          SubLesson(id: "expo_log_properties", title: "สมบัติลอการิทึม"),
        ],
      ),
    ],
  ),

  // 8. ฟังก์ชันตรีโกณมิติและการประยุกต์
  Topic(
    title: "ฟังก์ชันตรีโกณมิติและการประยุกต์",
    lessons: [
      LessonSummary(
        id: "trig_basics",
        title: "ตรีโกณมิติเบื้องต้น",
        subtopics: [
          SubLesson(id: "trig_intro", title: "แนะนำตรีโกณมิติ"),
          SubLesson(id: "trig_ratios", title: "อัตราส่วนตรีโกณมิติ"),
          SubLesson(id: "trig_identities", title: "เอกลักษณ์ตรีโกณมิติ"),
        ],
      ),
      LessonSummary(
        id: "trig_applications",
        title: "การประยุกต์ใช้",
        subtopics: [
          SubLesson(id: "trig_graphs", title: "กราฟฟังก์ชันตรีโกณมิติ"),
          SubLesson(id: "trig_equations", title: "สมการตรีโกณมิติ"),
        ],
      ),
    ],
  ),

  // 9. เวกเตอร์ในสามมิติ (3D Vectors)
  Topic(
    title: "เวกเตอร์ในสามมิติ",
    lessons: [
      LessonSummary(
        id: "vec_all",
        title: "เวกเตอร์ในสามมิติ",
        subtopics: [
          SubLesson(title: "พื้นฐานเวกเตอร์", isGroupHeader: true),
          SubLesson(id: "vec_properties", title: "สมบัติเวกเตอร์"),
          SubLesson(
            id: "vec_add_subtract",
            title: "การบวกลบเวกเตอร์",
            exerciseLessonId: "vec_basics_exercise",
          ),
          SubLesson(title: "ผลคูณเวกเตอร์", isGroupHeader: true),
          SubLesson(id: "vec_dot_product", title: "ผลคูณจุด (Dot Product)"),
          SubLesson(id: "vec_cross_product", title: "ผลคูณไขว้ (Cross Product)"),
          SubLesson(title: "การประยุกต์ใช้และแบบฝึกหัด", isGroupHeader: true),
          SubLesson(id: "vec_geometry_apps", title: "การใช้เวกเตอร์ในเรขาคณิต"),
          SubLesson(id: "vec_exercises", title: "แบบฝึกหัดรวม"),
        ],
      ),
    ],
  ),

  // 10. จำนวนเชิงซ้อน
  Topic(
    title: "จำนวนเชิงซ้อน",
    lessons: [
      LessonSummary(
        id: "complex_basics",
        title: "จำนวนเชิงซ้อนเบื้องต้น",
        subtopics: [
          SubLesson(id: "complex_intro", title: "แนะนำจำนวนเชิงซ้อน"),
          SubLesson(id: "complex_operations", title: "การดำเนินการ"),
          SubLesson(id: "complex_polar", title: "รูปเชิงขั้ว"),
          SubLesson(id: "complex_demoivre", title: "ทฤษฎีบทเดอมัวฟร์"),
        ],
      ),
    ],
  ),

  // 11. Combinatorics and Probability
  Topic(
    title: "combi",
    lessons: [
      LessonSummary(
        id: "combi_basics",
        title: "คอมบิ",
        subtopics: [
          SubLesson(id: "combi_counting", title: "หลักการนับ"),
          SubLesson(id: "combi_permutation", title: "การเรียงสับเปลี่ยน"),
          SubLesson(id: "combi_combination", title: "การจัดหมู่"),
        ],
      ),
      LessonSummary(
        id: "prob_basics",
        title: "ความน่าจะเป็น",
        subtopics: [
          SubLesson(id: "prob_intro", title: "แนะนำความน่าจะเป็น"),
          SubLesson(id: "prob_conditional", title: "ความน่าจะเป็นแบบมีเงื่อนไข"),
        ],
      ),
    ],
  ),

  // 12. สถิติ
  Topic(
    title: "สถิติ",
    lessons: [
      LessonSummary(
        id: "stat_basics",
        title: "สถิติเบื้องต้น",
        subtopics: [
          SubLesson(id: "stat_intro", title: "แนะนำสถิติ"),
          SubLesson(id: "stat_central", title: "ค่ากลาง"),
          SubLesson(id: "stat_dispersion", title: "การกระจาย"),
        ],
      ),
    ],
  ),

  // 13. ลำดับและอนุกรม
  Topic(
    title: "ลำดับและอนุกรม",
    lessons: [
      LessonSummary(
        id: "seq_basics",
        title: "ลำดับอนุกรม",
        subtopics: [
          SubLesson(id: "seq_intro", title: "แนะนำลำดับ"),
          SubLesson(id: "seq_arithmetic", title: "ลำดับเลขคณิต"),
          SubLesson(id: "seq_geometric", title: "ลำดับเรขาคณิต"),
          SubLesson(id: "seq_series", title: "อนุกรม"),
        ],
      ),
    ],
  ),

  // 14. Calculus เบื้องต้น
  Topic(
    title: "Calculus เบื้องต้น",
    lessons: [
      // ── ลิมิตและความต่อเนื่อง ────────────────────────────────────────────
      LessonSummary(
        id: "calc_limits",
        title: "ลิมิตและความต่อเนื่อง",
        subtopics: [
          SubLesson(title: "การหาค่าลิมิต", isGroupHeader: true),
          SubLesson(id: "calc_limit_graph", title: "การหาค่าลิมิตจากกราฟ"),
          SubLesson(id: "calc_limit_comp", title: "การหาค่าลิมิตจากกราฟฟังก์ชันประกอบ"),
          SubLesson(id: "calc_limit_condition", title: "เงื่อนไขการหาค่าลิมิต"),
          SubLesson(id: "calc_limit_poly", title: "ลิมิตการจัดรูปพหุนาม"),
          SubLesson(id: "calc_limit_abs", title: "ลิมิตค่าสัมบูรณ์"),
          SubLesson(id: "calc_limit_piece", title: "ลิมิตฟังก์ชันเงื่อนไข"),
          SubLesson(id: "calc_limit_inf", title: "ลิมิตเข้าใกล้อนันต์"),
          SubLesson(id: "calc_limit_inf2", title: "ลิมิตเข้าใกล้อนันต์เพิ่มเติม"),
          SubLesson(title: "ความต่อเนื่องฟังก์ชันและอัตราเปลี่ยนแปลง", isGroupHeader: true),
          SubLesson(id: "calc_continuity", title: "ความต่อเนื่องของฟังก์ชัน"),
          SubLesson(id: "calc_rate", title: "อัตราการเปลี่ยนแปลง"),
          SubLesson(id: "calc_rate_pt", title: "อัตราการเปลี่ยนแปลง ณ จุดใดๆ"),
        ],
      ),

      // ── อนุพันธ์ ────────────────────────────────────────────────────────
      LessonSummary(
        id: "calc_derivatives",
        title: "อนุพันธ์",
        subtopics: [
          SubLesson(title: "การหาค่าอนุพันธ์", isGroupHeader: true),
          SubLesson(id: "calc_deriv_intro", title: "นิยามและสมบัติของอนุพันธ์"),
          SubLesson(id: "calc_chain_rule", title: "กฎลูกโซ่"),
          SubLesson(id: "calc_lhopital", title: "กฎของโลปิตาล"),
          SubLesson(title: "ประยุกต์กับเรขาวิเคราะห์", isGroupHeader: true),
          SubLesson(id: "calc_tangent", title: "การหาสมการเส้นสัมผัส"),
          SubLesson(title: "ฟังก์ชันเพิ่ม-ลดและจุดสูงสุด-ต่ำสุด", isGroupHeader: true),
          SubLesson(id: "calc_incdec", title: "ฟังก์ชันเพิ่ม-ลด"),
          SubLesson(id: "calc_extrema", title: "จุดสูงสุด-ต่ำสุด"),
          SubLesson(id: "calc_ext_app", title: "โจทย์ประยุกต์จุดสูงสุด-ต่ำสุด"),
        ],
      ),

      // ── ปริพันธ์ ────────────────────────────────────────────────────────
      LessonSummary(
        id: "calc_integrals",
        title: "ปริพันธ์",
        subtopics: [
          SubLesson(title: "การหาค่า integrate", isGroupHeader: true),
          SubLesson(id: "calc_int_intro", title: "ปริพันธ์ (Integral)"),
          SubLesson(id: "calc_int_sub", title: "การเปลี่ยนตัวแปรในปริพันธ์"),
          SubLesson(title: "พื้นที่ใต้กราฟ", isGroupHeader: true),
          SubLesson(id: "calc_area", title: "การหาพื้นที่ใต้กราฟ"),
          SubLesson(id: "calc_area_enc", title: "การหาพื้นที่ปิดล้อม"),
          SubLesson(id: "calc_area_bet", title: "การหาพื้นที่ระหว่าง 2 กราฟ"),
          SubLesson(id: "calc_int_app", title: "การประยุกต์"),
        ],
      ),
    ],
  ),

  // 15. Expo2
  Topic(
    title: "Expo2",
    lessons: [
      LessonSummary(
        id: "expo2_log",
        title: "log",
        subtopics: [
          SubLesson(id: "expo2_log_advanced", title: "ลอการิทึมขั้นสูง"),
          SubLesson(id: "expo2_log_equations", title: "สมการลอการิทึม"),
        ],
      ),
    ],
  ),
];