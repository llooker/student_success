view: teacher_facts {
  view_label: "Students"
  derived_table: {
    explore_source: courses {
      column: user_id { field: teachers.user_id }
      column: count { field: coursework.count }
      column: count { field: coursework_submissions.count }
      column: number_late_submissions { field: coursework_submissions.number_late_submissions }
      column: min_grade_percent { field: coursework_submissions.min_grade_percent }
      column: max_grade_percent { field: coursework_submissions.max_grade_percent }
      column: median_grade_percent { field: coursework_submissions.median_grade_percent }
      column: average_grade_percent { field: coursework_submissions.average_grade_percent }
      column: percent_submitted { field: coursework.percent_submitted }
      column: percent_submissions_late { field: coursework_submissions.percent_submissions_late }
      filters: {
        field: teachers.user_id
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
    description: "Percent of assignments that were submitted"
    value_format: "#,##0.00%"
    type: number
  }

  dimension: percent_submissions_late {
    description: "Percent of submissions that were late"
    value_format: "#,##0.00%"
    type: number
  }

  dimension: average_grade_tier {
    type: tier
    sql: ${average_grade_percent}*100 ;;
    tiers: [60,70,80,90]
  }

  dimension: late_submissions_tier {
    type: tier
    sql: ${percent_submissions_late}*100 ;;
    tiers: [60,70,80,90]
  }

  dimension: submissions_tier {
    type: tier
    sql: ${percent_submitted}*100 ;;
    tiers: [60,70,80,90]
  }
}
