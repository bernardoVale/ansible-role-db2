NUM_PROC=$(ps -ef | grep $DB2INSTANCE | grep db2sysc | grep -v grep | wc -l)
if [[ $NUM_PROC -ne "1" ]]; then
db2start
fi
{%for db in item.dbs %}
  db2 create database {{db.name}} \
  {% if db.automatic is defined%}
  automatic storage {{db.automatic}} \
  {% endif %}
  {% if db.pagesize is defined %}
  pagesize {{db.pagesize}} \
  {% endif %}
  ;
{% endfor %}