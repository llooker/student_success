view: schools {
  sql_table_name: `looker-private-demo.classroom_staging.schools`
    ;;

  dimension: grades {
    description: "The grades that are in the school"
    type: string
    sql: ${TABLE}.grades ;;
  }

  dimension: school_type {
    type: string
    sql: case when 'K' in ${grades} then 'Elementary School'
              when '7' in ${grades} then 'Middle School'
              else 'High School' end;;
  }

  dimension: school_district {
    type: string
    sql: ${TABLE}.school_district ;;
  }

  dimension: school_name {
    primary_key: yes
    type: string
    sql: ${TABLE}.school_name ;;
  }

  measure: count {
    type: count_distinct
    sql: ${school_name} ;;
    drill_fields: [school_name]
  }

  measure: count_districts {
    type: count_distinct
    sql: ${school_district} ;;
  }
}
