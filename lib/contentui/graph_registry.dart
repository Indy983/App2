import 'package:flutter/material.dart';
import '../contentdata/interactivegraph/limitFound/graph_data1.dart' as LimFound1;
import '../contentdata/interactivegraph/limcomp/graph_data1.dart' as LimComp1;
import '../contentdata/interactivegraph/limit/graph_data_1.dart' as Graph1;
import '../contentdata/interactivegraph/limit/graph_data2.dart' as Graph2;
import '../contentdata/interactivegraph/limit/graph_data3.dart' as Graph3;
import '../contentdata/interactivegraph/limit/graph_data4.dart' as Graph4;
import '../contentdata/interactivegraph/limit/graph_data5.dart' as Graph5;
import '../contentdata/interactivegraph/limit/graph_data6.dart' as Graph6;
import '../contentdata/interactivegraph/limit/graph_data7.dart' as Graph7;
import '../contentdata/interactivegraph/limit/graph_data8.dart' as Graph8;
import '../contentdata/interactivegraph/limit/graph_data9.dart' as Graph9;
import '../contentdata/interactivegraph/limit/graph_data10.dart' as Graph10;
import '../contentdata/interactivegraph/limit/graph_data11.dart' as Graph11;
import '../contentdata/interactivegraph/limit/graph_data12.dart' as Graph12;
import '../contentdata/interactivegraph/limit/graph_data13.dart' as Graph13;
import '../contentdata/interactivegraph/limit/graph_data14.dart' as Graph14;
import '../contentdata/interactivegraph/limit/graph_data15.dart' as Graph15;
import '../contentdata/interactivegraph/slope/graph_data_slope.dart' as GraphSlope;
import '../contentdata/interactivegraph/tangent/graph_data_tangent.dart'
    as GraphTangent;
import '../contentdata/interactivegraph/vector/vector_data1.dart' as VectorGraph1;
import '../contentdata/interactivegraph/vector/vector_data2.dart' as VectorGraph2;
import '../contentdata/interactivegraph/vector/animated.dart' as Animated;
import '../contentdata/interactivegraph/clock/clock_data.dart' as ClockData;
import '../contentdata/interactivegraph/geometry/graph_data1.dart' as Geo1;
import '../contentdata/interactivegraph/geometry/graph_data2.dart' as Geo2;
import '../contentdata/interactivegraph/geometry/graph_data3.dart' as Geo3;
import '../contentdata/interactivegraph/geometry/graph_data4.dart' as Geo4;
import '../contentdata/interactivegraph/geometry/graph_data5.dart' as Geo5;
import '../contentdata/interactivegraph/complex/graph_complex1.dart'
    as ComplexGraph1;
import '../contentdata/interactivegraph/sets/venn_diagram_data.dart' as Sets1;
import '../contentdata/interactivegraph/venn/venn_data.dart' as Venn1;
import '../contentdata/interactivegraph/tangent/graph_data_tangent2.dart' as GraphTangent2;


class GraphRegistry {
  static Widget getGraph(String path) {
    switch (path) {
      case 'limFound1':
       return LimFound1.getGraphWidget();
      case 'limComp1':
       return LimComp1.getGraphWidget();
      case 'graph_data_1':
        return Graph1.getGraphWidget(); // From graph_data_1.dart
      case 'graph_data_2':
        return Graph2.getGraphWidget();
      case 'graph_data_3':
        return Graph3.getGraphWidget();
      case 'graph_data_4':
        return Graph4.getGraphWidget();
      case 'graph_data_5':
        return Graph5.getGraphWidget();
      case 'graph_data_6':
        return Graph6.getGraphWidget();
      case 'graph_data_7':
        return Graph7.getGraphWidget();
      case 'graph_data_8':
        return Graph8.getGraphWidget();
      case 'graph_data_9':
        return Graph9.getGraphWidget();
      case 'graph_data_10':
        return Graph10.getGraphWidget();
      case 'graph_data_11':
        return Graph11.getGraphWidget();
      case 'graph_data_12':
        return Graph12.getGraphWidget();
      case 'graph_data_13':
        return Graph13.getGraphWidget();
      case 'graph_data_14':
        return Graph14.getGraphWidget();
      case 'graph_data_15':
        return Graph15.getGraphWidget();
      case 'graph_data_slope':
        return GraphSlope.getGraphWidget();
      case 'graph_data_tangent':
        return GraphTangent.getGraphWidget();
      case 'graph_data_tangent2':
        return GraphTangent2.getGraphWidget();
      case 'vector_graph_1':
        return VectorGraph1.getVectorWidget();
      case 'vector_graph_2':
        return VectorGraph2.getVectorWidget();
      case 'animated_vector':
        return Animated.getVectorWidget();
      case 'clock_data':
        return ClockData.ClockData.getClockWidget();
      case 'geo1':
        return Geo1.getGraphWidget();
      case 'geo2':
        return Geo2.getGraphWidget2();
      case 'geo3':
        return Geo3.getGraphWidget();
      case 'geo4':
        return Geo4.getGraphWidget();
      case 'geo5':
        return Geo5.getGraphWidget();
      case 'complex_graph_1':
        return ComplexGraph1.getComplexWidget();
      case 'sets_1':
        return Sets1.getVennDiagramWidget();
      case 'venn_1':
        return Venn1.getVennDiagramWidget();
      default:
        return Center(child: Text("Graph not found: $path"));
    }
  }
}