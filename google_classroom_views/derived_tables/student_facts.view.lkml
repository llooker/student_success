# If necessary, uncomment the line below to include explore_source.
# include: "student_success.model.lkml"

view: student_facts {
  view_label: "Students"
  derived_table: {
    explore_source: courses {
      column: user_id { field: students.user_id }
      column: count { field: coursework.count }
      column: count { field: coursework_submissions.count }
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

  dimension: percent_points_earned {}

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

  dimension: is_missing_all {
    group_label: "Submissions"
    type: yesno
    sql: ${percent_missing}=1;;
  }


  measure: average_points_earned {
    type: average
    sql: ${percent_points_earned} ;;
  }

  measure: number_students_missing_all_assignments {
    type: count
    filters: [
      is_missing_all: "yes"
    ]
  }




}
