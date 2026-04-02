import '../../ui/content_models.dart';
import 'content/1.set_data.dart';
import 'content/2.logic_data.dart';
import 'content/3.real_number_data.dart';
import 'content/4.matrix_data.dart';
import 'content/5.function_data.dart';
import 'content/6.geometry_data.dart';
import 'content/7.expo_log_data.dart';
import 'content/8.trig_data.dart';
import 'content/9.vector_data.dart';
import 'content/10.complex_data.dart';
import 'content/11.combi_prob_data.dart';
import 'content/12.statistics_data.dart';
import 'content/13.sequence_data.dart';
import 'content/14.calculus_data.dart';

/// Central registry for all lesson data
/// Returns the appropriate ContentLesson based on the lesson ID
dynamic getLessonData(String id) {
  final lessonRegistry = <String, ContentLesson>{
    // 1. Sets
    'set_intro': setIntroLesson,
    'set_operations': setOperationsLesson,
    'set_venn': setVennLesson,

    // 2. Logic
    'logic_intro': logicIntroLesson,
    'logic_operators': logicOperatorsLesson,
    'logic_truth_table': logicTruthTableLesson,

    // 3. Real Numbers
    'real_intro': realIntroLesson,
    'real_properties': realPropertiesLesson,
    'real_inequalities': realInequalitiesLesson,

    // 4. Matrix
    'matrix_intro': matrixIntroLesson,
    'matrix_operations': matrixOperationsLesson,
    'matrix_determinant': matrixDeterminantLesson,
    'matrix_linear_systems': matrixLinearSystemsLesson,

    // 5. Functions
    'function_intro': functionIntroLesson,
    'function_types': functionTypesLesson,
    'function_composition': functionCompositionLesson,
    'function_inverse': functionInverseLesson,

    // 6. Geometry
    'geometry_coordinate': geometryCoordinateLesson,
    'geometry_distance': geometryDistanceLesson,
    'geometry_lines': geometryLinesLesson,
    'geometry_circle': geometryCircleLesson,
    'geometry_parabola': geometryParabolaLesson,
    'geometry_ellipse': geometryEllipseLesson,
    'geometry_hyperbola': geometryHyperbolaLesson,

    // 7. Exponential & Logarithm
    'expo_intro': expoIntroLesson,
    'expo_properties': expoPropertiesLesson,
    'expo_log_intro': expoLogIntroLesson,
    'expo_log_properties': expoLogPropertiesLesson,

    // 8. Trigonometry
    'trig_intro': trigIntroLesson,
    'trig_ratios': trigRatiosLesson,
    'trig_identities': trigIdentitiesLesson,
    'trig_graphs': trigGraphsLesson,
    'trig_equations': trigEquationsLesson,

    // 9. Vectors (3D)
    'vec_properties': vectorPropertiesLesson,
    'vec_add_subtract': vectorAddSubtractLesson,
    'vec_dot_product': vectorDotProductLesson,
    'vec_cross_product': vectorCrossProductLesson,
    'vec_geometry_apps': vectorGeometryApplicationsLesson,
    'vec_exercises': vectorComprehensiveExercisesLesson,
    'vec_basics_exercise': vectorComprehensiveExercisesLesson,

    // 10. Complex Numbers
    'complex_intro': complexIntroLesson,
    'complex_operations': complexOperationsLesson,
    'complex_polar': complexPolarLesson,
    'complex_demoivre': complexDemoivreLesson,

    // 11. Combinatorics & Probability
    'combi_counting': combiCountingLesson,
    'combi_permutation': combiPermutationLesson,
    'combi_combination': combiCombinationLesson,
    'prob_intro': probIntroLesson,
    'prob_conditional': probConditionalLesson,

    // 12. Statistics
    'stat_intro': statIntroLesson,
    'stat_central': statCentralLesson,
    'stat_dispersion': statDispersionLesson,

    // 13. Sequences & Series
    'seq_intro': seqIntroLesson,
    'seq_arithmetic': seqArithmeticLesson,
    'seq_geometric': seqGeometricLesson,
    'seq_series': seqSeriesLesson,

    // 14. Calculus ─────────────────────────────────────────────────────────
    // ลิมิตและความต่อเนื่อง → การหาค่าลิมิต
    'calc_limit_graph':      calcLimitGraphLesson,
    'calc_limit_comp':       calcCompositeLimitGraphLesson,
    'calc_limit_condition':  calcLimitConditionLesson,
    'calc_limit_poly':       calcLimitPolynomialLesson,
    'calc_limit_abs':        calcLimitAbsoluteLesson,
    'calc_limit_piece':      calcLimitPiecewiseLesson,
    'calc_limit_inf':        calcLimitInfinityLesson,
    'calc_limit_inf2':       calcLimitInfinityExtraLesson,
    // ลิมิตและความต่อเนื่อง → ความต่อเนื่องฟังก์ชันและอัตราเปลี่ยนแปลง
    'calc_continuity':       calcContinuityLesson,
    'calc_rate':             calcRateOfChangeLesson,
    'calc_rate_pt':          calcRateAtPointLesson,
    // อนุพันธ์ → การหาค่าอนุพันธ์
    'calc_deriv_intro':      calcDerivIntroLesson,
    'calc_chain_rule':       calcChainRuleLesson,
    'calc_lhopital':         calcLHopitalLesson,
    // อนุพันธ์ → ประยุกต์กับเรขาวิเคราะห์
    'calc_tangent':          calcTangentLineLesson,
    // อนุพันธ์ → ฟังก์ชันเพิ่ม-ลดและจุดสูงสุด-ต่ำสุด
    'calc_incdec':           calcIncDecLesson,
    'calc_extrema':          calcExtremaLesson,
    'calc_ext_app':          calcAppliedExtremaLesson,
    // ปริพันธ์ → การหาค่า integrate
    'calc_int_intro':        calcIntIntroLesson,
    'calc_int_sub':          calcIntSubstitutionLesson,
    // ปริพันธ์ → พื้นที่ใต้กราฟ
    'calc_area':             calcAreaLesson,
    'calc_area_enc':         calcEnclosedAreaLesson,
    'calc_area_bet':         calcAreaBetweenLesson,
    'calc_int_app':          calcIntApplicationLesson,
  };

  return lessonRegistry[id];
}