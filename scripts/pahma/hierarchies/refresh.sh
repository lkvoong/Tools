TENANT=$1
HOSTNAME="dba-postgres-prod-45.ist.berkeley.edu port=5307 sslmode=prefer"
USERNAME="nuxeo_${TENANT}"
DATABASE="${TENANT}_domain_${TENANT}"
CONNECTSTRING="host=$HOSTNAME dbname=$DATABASE"
time psql -U $USERNAME -d "$CONNECTSTRING" -c "select utils.refreshculturehierarchytable();"
time psql -U $USERNAME -d "$CONNECTSTRING" -c "select utils.refreshmaterialhierarchytable();"
time psql -U $USERNAME -d "$CONNECTSTRING" -c "select utils.refreshtaxonhierarchytable();"
time psql -U $USERNAME -d "$CONNECTSTRING" -c "select utils.refreshobjectplacelocationtable();"
