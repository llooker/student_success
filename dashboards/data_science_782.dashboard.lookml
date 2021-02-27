# - dashboard: data_science
#   title: Data Science
#   layout: newspaper
#   elements:
#   - name: A - Generate Model Inputs
#     type: text
#     title_text: A - Generate Model Inputs
#     row: 0
#     col: 0
#     width: 23
#     height: 2
#   - name: B - Train the Model
#     type: text
#     title_text: B - Train the Model
#     row: 8
#     col: 0
#     width: 22
#     height: 2
#   - name: C - Apply Model
#     type: text
#     title_text: C - Apply Model
#     row: 16
#     col: 0
#     width: 22
#     height: 3
#   - title: Performance by Meets Attended
#     name: Performance by Meets Attended
#     model: student_success
#     explore: data_science_inputs
#     type: looker_scatter
#     fields: [data_science_inputs.student_user_id, data_science_inputs.percent_points_earned,
#       data_science_inputs.total_attended]
#     sorts: [data_science_inputs.student_user_id desc]
#     limit: 5000
#     column_limit: 50
#     x_axis_gridlines: false
#     y_axis_gridlines: true
#     show_view_names: false
#     show_y_axis_labels: true
#     show_y_axis_ticks: true
#     y_axis_tick_density: default
#     y_axis_tick_density_custom: 5
#     show_x_axis_label: true
#     show_x_axis_ticks: true
#     y_axis_scale_mode: linear
#     x_axis_reversed: false
#     y_axis_reversed: false
#     plot_size_by_field: false
#     trellis: ''
#     stacking: ''
#     limit_displayed_rows: false
#     legend_position: center
#     point_style: none
#     show_value_labels: false
#     label_density: 25
#     x_axis_scale: auto
#     y_axis_combined: true
#     show_null_points: true
#     y_axes: [{label: Average Course Grade, orientation: left, series: [{axisId: data_science_inputs.percent_points_earned,
#             id: data_science_inputs.percent_points_earned, name: Percent Points Earned}],
#         showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
#         tickDensityCustom: 5, type: linear}]
#     x_axis_label: Average Meets Attended
#     trend_lines: [{color: "#000000", label_position: right, period: 7, regression_type: linear,
#         series_index: 1, show_label: true, label_type: r2}]
#     defaults_version: 1
#     hidden_fields: [data_science_inputs.student_user_id]
#     row: 2
#     col: 16
#     width: 8
#     height: 6
#   - title: Performance by Assignments Submitted
#     name: Performance by Assignments Submitted
#     model: student_success
#     explore: data_science_inputs
#     type: looker_scatter
#     fields: [data_science_inputs.student_user_id, data_science_inputs.percent_points_earned,
#       data_science_inputs.count]
#     sorts: [data_science_inputs.student_user_id desc]
#     limit: 5000
#     column_limit: 50
#     x_axis_gridlines: false
#     y_axis_gridlines: true
#     show_view_names: false
#     show_y_axis_labels: true
#     show_y_axis_ticks: true
#     y_axis_tick_density: default
#     y_axis_tick_density_custom: 5
#     show_x_axis_label: true
#     show_x_axis_ticks: true
#     y_axis_scale_mode: linear
#     x_axis_reversed: false
#     y_axis_reversed: false
#     plot_size_by_field: false
#     trellis: ''
#     stacking: ''
#     limit_displayed_rows: false
#     legend_position: center
#     point_style: none
#     show_value_labels: false
#     label_density: 25
#     x_axis_scale: auto
#     y_axis_combined: true
#     show_null_points: true
#     y_axes: [{label: Average Course Grade, orientation: left, series: [{axisId: data_science_inputs.percent_points_earned,
#             id: data_science_inputs.percent_points_earned, name: Percent Points Earned}],
#         showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
#         tickDensityCustom: 5, type: linear}]
#     x_axis_label: Average Assignments Submitted
#     trend_lines: [{color: "#000000", label_position: right, period: 7, regression_type: linear,
#         series_index: 1, show_label: true, label_type: r2}]
#     defaults_version: 1
#     hidden_fields: [data_science_inputs.student_user_id]
#     row: 2
#     col: 0
#     width: 8
#     height: 6
#   - title: Performance by Late Assignments
#     name: Performance by Late Assignments
#     model: student_success
#     explore: data_science_inputs
#     type: looker_scatter
#     fields: [data_science_inputs.student_user_id, data_science_inputs.percent_points_earned,
#       data_science_inputs.average_days_to_submit]
#     filters:
#       data_science_inputs.average_days_to_submit: "<3"
#     sorts: [data_science_inputs.student_user_id desc]
#     limit: 5000
#     column_limit: 50
#     x_axis_gridlines: false
#     y_axis_gridlines: true
#     show_view_names: false
#     show_y_axis_labels: true
#     show_y_axis_ticks: true
#     y_axis_tick_density: default
#     y_axis_tick_density_custom: 5
#     show_x_axis_label: true
#     show_x_axis_ticks: true
#     y_axis_scale_mode: linear
#     x_axis_reversed: false
#     y_axis_reversed: false
#     plot_size_by_field: false
#     trellis: ''
#     stacking: ''
#     limit_displayed_rows: false
#     legend_position: center
#     point_style: none
#     show_value_labels: false
#     label_density: 25
#     x_axis_scale: auto
#     y_axis_combined: true
#     show_null_points: true
#     y_axes: [{label: Average Course Grade, orientation: left, series: [{axisId: data_science_inputs.percent_points_earned,
#             id: data_science_inputs.percent_points_earned, name: Percent Points Earned}],
#         showLabels: true, showValues: true, minValue: !!null '', unpinAxis: false,
#         tickDensity: default, tickDensityCustom: 5, type: linear}]
#     x_axis_label: Average Late Assignments
#     trend_lines: [{color: "#000000", label_position: right, period: 7, regression_type: linear,
#         series_index: 1, show_label: true, label_type: r2}]
#     defaults_version: 1
#     hidden_fields: [data_science_inputs.student_user_id]
#     row: 2
#     col: 8
#     width: 8
#     height: 6
#   - title: Training Detail
#     name: Training Detail
#     model: student_success
#     explore: predicted_performance_training
#     type: looker_grid
#     fields: [predicted_performance_training.iteration, predicted_performance_training.loss,
#       predicted_performance_training.duration_ms]
#     sorts: [predicted_performance_training.iteration]
#     limit: 500
#     query_timezone: America/Los_Angeles
#     show_view_names: false
#     show_row_numbers: true
#     transpose: false
#     truncate_text: true
#     hide_totals: false
#     hide_row_totals: false
#     size_to_fit: true
#     table_theme: white
#     limit_displayed_rows: false
#     enable_conditional_formatting: false
#     header_text_alignment: left
#     header_font_size: '12'
#     rows_font_size: '12'
#     conditional_formatting_include_totals: false
#     conditional_formatting_include_nulls: false
#     show_sql_query_menu_options: false
#     column_order: ["$$$_row_numbers_$$$", predicted_performance_training.iteration,
#       predicted_performance_training.duration_ms, predicted_performance_training.loss]
#     show_totals: true
#     show_row_totals: true
#     series_cell_visualizations:
#       predicted_performance_training.loss:
#         is_active: true
#         palette:
#           palette_id: 48028ee3-009d-a2db-6e11-ac4d00f9c4dc
#           collection_id: google
#           custom_colors:
#           - "#95ccff"
#           - "#4285F4"
#           - "#185ABC"
#     x_axis_gridlines: false
#     y_axis_gridlines: true
#     show_y_axis_labels: true
#     show_y_axis_ticks: true
#     y_axis_tick_density: default
#     y_axis_tick_density_custom: 5
#     show_x_axis_label: true
#     show_x_axis_ticks: true
#     y_axis_scale_mode: linear
#     x_axis_reversed: false
#     y_axis_reversed: false
#     plot_size_by_field: false
#     trellis: ''
#     stacking: ''
#     legend_position: center
#     point_style: none
#     show_value_labels: false
#     label_density: 25
#     x_axis_scale: auto
#     y_axis_combined: true
#     ordering: none
#     show_null_labels: false
#     show_totals_labels: false
#     show_silhouette: false
#     totals_color: "#808080"
#     defaults_version: 1
#     series_types: {}
#     row: 10
#     col: 4
#     width: 10
#     height: 6
#   - title: Training Loss
#     name: Training Loss
#     model: student_success
#     explore: predicted_performance_training
#     type: looker_area
#     fields: [predicted_performance_training.loss, predicted_performance_training.iteration,
#       predicted_performance_training.duration_ms]
#     sorts: [predicted_performance_training.iteration]
#     limit: 500
#     query_timezone: America/Los_Angeles
#     x_axis_gridlines: false
#     y_axis_gridlines: true
#     show_view_names: false
#     show_y_axis_labels: true
#     show_y_axis_ticks: true
#     y_axis_tick_density: default
#     y_axis_tick_density_custom: 5
#     show_x_axis_label: true
#     show_x_axis_ticks: true
#     y_axis_scale_mode: linear
#     x_axis_reversed: false
#     y_axis_reversed: false
#     plot_size_by_field: false
#     trellis: ''
#     stacking: ''
#     limit_displayed_rows: false
#     legend_position: center
#     point_style: circle
#     show_value_labels: true
#     label_density: 25
#     x_axis_scale: auto
#     y_axis_combined: true
#     show_null_points: true
#     interpolation: linear
#     show_totals_labels: false
#     show_silhouette: false
#     totals_color: "#808080"
#     series_types: {}
#     label_color: [black]
#     swap_axes: false
#     show_sql_query_menu_options: false
#     column_order: ["$$$_row_numbers_$$$", predicted_performance_training.iteration,
#       predicted_performance_training.duration_ms, predicted_performance_training.loss]
#     show_totals: true
#     show_row_totals: true
#     show_row_numbers: true
#     transpose: false
#     truncate_text: true
#     size_to_fit: true
#     series_cell_visualizations:
#       predicted_performance_training.loss:
#         is_active: true
#         palette:
#           palette_id: 48028ee3-009d-a2db-6e11-ac4d00f9c4dc
#           collection_id: google
#           custom_colors:
#           - "#95ccff"
#           - "#4285F4"
#           - "#185ABC"
#     table_theme: white
#     enable_conditional_formatting: false
#     header_text_alignment: left
#     header_font_size: '12'
#     rows_font_size: '12'
#     conditional_formatting_include_totals: false
#     conditional_formatting_include_nulls: false
#     ordering: none
#     show_null_labels: false
#     defaults_version: 1
#     hide_totals: false
#     hide_row_totals: false
#     row: 10
#     col: 14
#     width: 10
#     height: 6
#   - title: New Tile
#     name: New Tile
#     model: student_success
#     explore: predicted_performance_training
#     type: single_value
#     fields: [predicted_performance_training.iterations]
#     limit: 500
#     query_timezone: America/Los_Angeles
#     custom_color_enabled: true
#     show_single_value_title: true
#     show_comparison: false
#     comparison_type: value
#     comparison_reverse_colors: false
#     show_comparison_label: true
#     enable_conditional_formatting: false
#     conditional_formatting_include_totals: false
#     conditional_formatting_include_nulls: false
#     single_value_title: "# Iterations"
#     x_axis_gridlines: false
#     y_axis_gridlines: true
#     show_view_names: false
#     show_y_axis_labels: true
#     show_y_axis_ticks: true
#     y_axis_tick_density: default
#     y_axis_tick_density_custom: 5
#     show_x_axis_label: true
#     show_x_axis_ticks: true
#     y_axis_scale_mode: linear
#     x_axis_reversed: false
#     y_axis_reversed: false
#     plot_size_by_field: false
#     trellis: ''
#     stacking: ''
#     limit_displayed_rows: false
#     legend_position: center
#     series_types: {}
#     point_style: circle
#     show_value_labels: true
#     label_density: 25
#     label_color: [black]
#     x_axis_scale: auto
#     y_axis_combined: true
#     swap_axes: false
#     show_null_points: true
#     interpolation: linear
#     show_totals_labels: false
#     show_silhouette: false
#     totals_color: "#808080"
#     show_sql_query_menu_options: false
#     column_order: ["$$$_row_numbers_$$$", predicted_performance_training.iteration,
#       predicted_performance_training.duration_ms, predicted_performance_training.loss]
#     show_totals: true
#     show_row_totals: true
#     show_row_numbers: true
#     transpose: false
#     truncate_text: true
#     size_to_fit: true
#     series_cell_visualizations:
#       predicted_performance_training.loss:
#         is_active: true
#         palette:
#           palette_id: 48028ee3-009d-a2db-6e11-ac4d00f9c4dc
#           collection_id: google
#           custom_colors:
#           - "#95ccff"
#           - "#4285F4"
#           - "#185ABC"
#     table_theme: white
#     header_text_alignment: left
#     header_font_size: '12'
#     rows_font_size: '12'
#     ordering: none
#     show_null_labels: false
#     defaults_version: 1
#     hide_totals: false
#     hide_row_totals: false
#     row: 10
#     col: 0
#     width: 4
#     height: 6
#   - title: New Tile
#     name: New Tile (2)
#     model: student_success
#     explore: predicted_performance_applied
#     type: single_value
#     fields: [predicted_performance_applied.sum_of_predicted_at_risk, predicted_performance_applied.percent_of_students_at_risk]
#     limit: 500
#     query_timezone: America/Los_Angeles
#     custom_color_enabled: true
#     show_single_value_title: true
#     show_comparison: true
#     comparison_type: value
#     comparison_reverse_colors: false
#     show_comparison_label: true
#     enable_conditional_formatting: false
#     conditional_formatting_include_totals: false
#     conditional_formatting_include_nulls: false
#     custom_color: "#EA4335"
#     single_value_title: Students At Risk
#     comparison_label: Percent At Risk
#     series_types: {}
#     defaults_version: 1
#     row: 19
#     col: 0
#     width: 4
#     height: 5
#   - title: Predictive Power
#     name: Predictive Power
#     model: student_success
#     explore: predicted_performance_evaluation
#     type: looker_single_record
#     fields: [predicted_performance_evaluation.davies_bouldin_index, predicted_performance_evaluation.mean_squared_distance]
#     sorts: [predicted_performance_evaluation.davies_bouldin_index]
#     limit: 500
#     query_timezone: America/Los_Angeles
#     show_view_names: false
#     series_types: {}
#     show_row_numbers: true
#     transpose: false
#     truncate_text: true
#     hide_totals: false
#     hide_row_totals: false
#     size_to_fit: true
#     table_theme: white
#     limit_displayed_rows: false
#     enable_conditional_formatting: false
#     header_text_alignment: left
#     header_font_size: 12
#     rows_font_size: 12
#     conditional_formatting_include_totals: false
#     conditional_formatting_include_nulls: false
#     defaults_version: 1
#     row: 24
#     col: 0
#     width: 4
#     height: 2
#   - title: Predicted Performance Breakdown
#     name: Predicted Performance Breakdown
#     model: student_success
#     explore: predicted_performance_applied
#     type: looker_column
#     fields: [predicted_performance_applied.predicted_grade, predicted_performance_applied.count]
#     sorts: [predicted_performance_applied.predicted_grade]
#     limit: 500
#     total: true
#     query_timezone: America/Los_Angeles
#     x_axis_gridlines: false
#     y_axis_gridlines: true
#     show_view_names: false
#     show_y_axis_labels: true
#     show_y_axis_ticks: true
#     y_axis_tick_density: default
#     y_axis_tick_density_custom: 5
#     show_x_axis_label: true
#     show_x_axis_ticks: true
#     y_axis_scale_mode: linear
#     x_axis_reversed: false
#     y_axis_reversed: false
#     plot_size_by_field: false
#     trellis: ''
#     stacking: ''
#     limit_displayed_rows: false
#     legend_position: center
#     point_style: none
#     show_value_labels: false
#     label_density: 25
#     x_axis_scale: auto
#     y_axis_combined: true
#     ordering: none
#     show_null_labels: false
#     show_totals_labels: false
#     show_silhouette: false
#     totals_color: "#808080"
#     defaults_version: 1
#     row: 19
#     col: 4
#     width: 10
#     height: 7
#   - title: Teacher Breakdown
#     name: Teacher Breakdown
#     model: student_success
#     explore: predicted_performance_applied
#     type: looker_grid
#     fields: [teacher_profiles.name, predicted_performance_applied.percent_of_students_at_risk,
#       predicted_performance_applied.sum_of_predicted_at_risk]
#     sorts: [teacher_profiles.name]
#     limit: 500
#     query_timezone: America/Los_Angeles
#     show_view_names: false
#     show_row_numbers: true
#     transpose: false
#     truncate_text: true
#     hide_totals: false
#     hide_row_totals: false
#     size_to_fit: true
#     table_theme: white
#     limit_displayed_rows: false
#     enable_conditional_formatting: false
#     header_text_alignment: left
#     header_font_size: '12'
#     rows_font_size: '12'
#     conditional_formatting_include_totals: false
#     conditional_formatting_include_nulls: false
#     show_sql_query_menu_options: false
#     show_totals: true
#     show_row_totals: true
#     series_cell_visualizations:
#       predicted_performance_applied.percent_of_students_at_risk:
#         is_active: false
#     x_axis_gridlines: false
#     y_axis_gridlines: true
#     show_y_axis_labels: true
#     show_y_axis_ticks: true
#     y_axis_tick_density: default
#     y_axis_tick_density_custom: 5
#     show_x_axis_label: true
#     show_x_axis_ticks: true
#     y_axis_scale_mode: linear
#     x_axis_reversed: false
#     y_axis_reversed: false
#     plot_size_by_field: false
#     trellis: ''
#     stacking: ''
#     legend_position: center
#     point_style: none
#     show_value_labels: false
#     label_density: 25
#     x_axis_scale: auto
#     y_axis_combined: true
#     ordering: none
#     show_null_labels: false
#     show_totals_labels: false
#     show_silhouette: false
#     totals_color: "#808080"
#     defaults_version: 1
#     series_types: {}
#     row: 19
#     col: 14
#     width: 10
#     height: 7
#   filters:
#   - name: District
#     title: District
#     type: field_filter
#     default_value: ''
#     allow_multiple_values: true
#     required: false
#     model: edu_bqml_demo
#     explore: predicted_performance_applied
#     listens_to_filters: []
#     field: schools.school_district
#   - name: School
#     title: School
#     type: field_filter
#     default_value: ''
#     allow_multiple_values: true
#     required: false
#     model: edu_bqml_demo
#     explore: predicted_performance_applied
#     listens_to_filters: []
#     field: schools.school_name
