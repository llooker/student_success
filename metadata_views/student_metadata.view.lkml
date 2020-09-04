view: student_metadata {
  view_label: "Students"
  sql_table_name: `looker-private-demo.classroom_staging.student_metadata`
    ;;

  dimension: grade {
    type: string
    sql: ${TABLE}.grade ;;
  }

  dimension: user_id {
    hidden: yes
    type: string
    sql: ${TABLE}.userId ;;
  }
}
