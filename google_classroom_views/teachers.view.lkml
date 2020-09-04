view: teachers {
  sql_table_name: `looker-private-demo.classroom_staging.teachers`
    ;;

  dimension: course_id {
    type: string
    hidden: yes
    sql: ${TABLE}.courseId ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.userId ;;
  }

  measure: count {
    label: "Number of Teachers"
    type: count_distinct
    sql: ${user_id} ;;
    drill_fields: [courses.name, courses.id]
  }
}
