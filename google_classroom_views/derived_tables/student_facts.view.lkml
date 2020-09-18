# If necessary, uncomment the line below to include explore_source.
# include: "student_success.model.lkml"

view: student_facts {
  drill_fields: [student_profiles.name,student_metadata.average_points_earned, student_profiles.email_address,
    guardian_profiles.email_address, student_health_score,student_attendance_facts.percent_attended,
    student_chrome_facts.average_daily_duration
  ]
  view_label: "Students"
  derived_table: {
    datagroup_trigger: classroom_trigger
    explore_source: courses {
      column: user_id { field: students.user_id }
      column: count_courseworks { field: coursework.count }
      column: count_submissions { field: coursework_submissions.count }
      column: number_late_submissions { field: coursework_submissions.number_late_submissions }
      column: min_grade_percent { field: coursework_submissions.min_grade_percent }
      column: max_grade_percent { field: coursework_submissions.max_grade_percent }
      column: median_grade_percent { field: coursework_submissions.median_grade_percent }
      column: average_grade_percent { field: coursework_submissions.average_grade_percent }
      column: percent_missing { field: coursework.percent_missing }
      column: percent_points_earned { field: coursework_submissions.percent_points_earned}
      column: percent_submissions_late { field: coursework_submissions.percent_submissions_late }
      filters: {
        field: students.user_id
        value: "-NULL"
      }
    }
  }

  dimension: user_id {
    primary_key: yes
    hidden: yes
    label: "Students Student ID"
  }

  dimension: count_courseworks {
    hidden: yes
    label: "Number of Courseworks"
    type: number
  }

  dimension: count_submissions {
    hidden: yes
    label: "Number of Submissions"
    type: number
  }

  dimension: number_late_submissions {
    hidden: yes
    type: number
  }

  dimension: min_grade_percent {
    group_label: "Grades"
    value_format: "#,##0.00%"
    type: number
  }

  dimension: max_grade_percent {
    group_label: "Grades"
    value_format: "#,##0.00%"
    type: number
  }

  dimension: median_grade_percent {
    group_label: "Grades"
    value_format: "#,##0.00%"
    type: number
  }

  dimension: average_grade_percent {
    group_label: "Grades"
    value_format: "#,##0.00%"
    type: number
  }

  dimension: percent_submitted {
    group_label: "Submissions"
    description: "Percent of assignments that were submitted"
    value_format: "#,##0.00%"
    type: number
  }

  dimension: percent_missing{
    group_label: "Submissions"
    description: "Percent of coursework that has not been completed"
    value_format: "#,##0.00%"
    type: number
  }

  dimension: percent_points_earned {
    type: number
  }

  dimension: average_grade_tier {
#     group_label: "Tiers"
    type: tier
    sql: ${percent_points_earned}*100 ;;
    tiers: [60,70,80,90]
    style: integer
  }

  dimension: missing_submissions_tier {
    group_label: "Submissions"
    type: tier
    sql: ${percent_missing}*100 ;;
    tiers: [25,50,75]
    style: integer
  }

#   dimension: student_healthscore_tier {
#     group_label: "Health Score"
#     type: tier
# #     sql: ${percent_missing}*100 ;;
# #     tiers: [25,50,75]
#     style: integer
#   }

  dimension: is_missing_all {
    group_label: "Submissions"
    type: yesno
    sql: ${percent_missing}>.5;;
  }

  dimension: student_health_score {
    group_label: "Health Score"
    type: number
    value_format_name: decimal_2
    description: "Health score to flag at risk students, combination of grade, attendance rate and time on chromebook"
    sql: (coalesce(${average_grade_percent},0)+
          coalesce(${student_attendance_facts.percent_attended},0)+(
        coalesce( ${student_chrome_facts.average_daily_duration},0)/120))/3 ;;
  }

  measure: average_points_earned {
    type: average
    sql: ${percent_points_earned} ;;
    value_format_name: percent_2
  }

  measure: missing_more_than_half {
    type: count
    filters: [
      percent_missing: ">=.5"
    ]
  }

  measure: number_students_missing_all_assignments {
    type: count
    filters: [
      is_missing_all: "yes"
    ]
  }

  measure:  average_student_health_score {
    type: average
    sql:  ${student_health_score};;
    group_label: "Health Score"
    value_format_name: decimal_2
  }

   measure: number_at_risk_students {
    group_label: "Health Score"
    description: "Students with a health score below .4"
    type: count
    filters: [
      student_health_score: "<.3"
    ]
  }

  measure:  percent_student_at_risk {
    group_label: "Health Score"
    type: number
    sql: ${number_at_risk_students}/nullif(${students.count},0) ;;
    value_format_name: percent_1
  }

}
