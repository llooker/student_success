view: students {
  sql_table_name: `looker-private-demo.classroom_staging.students`
    ;;

  dimension: pk {
    primary_key: yes
    hidden: yes
    sql: concat(${user_id}, '-', ${course_id}) ;;
  }

  dimension: course_id {
    type: string
    hidden: yes
    sql: ${TABLE}.courseId ;;
  }

  dimension: user_id {
    label: "Student ID"
    type: string
    sql: ${TABLE}.userId ;;
  }

  measure: count {
    label: "Number of Students"
    type: count_distinct
    sql: ${user_id} ;;
    drill_fields: [courses.name, courses.id]
  }
}
