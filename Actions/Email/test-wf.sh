#!/bin/sh

# Check if OOZIE_URL is set
if [ -z ${OOZIE_URL} ] 
 then 
	echo '$OOZIE_URL is not set !!!.'
	echo " - Please export variable first: ex: (http://localhost:11000/oozie)"
    exit 1
fi

# Check if properties file exist
if [ ! -f workflow.properties ] 
then
    echo "workflow.properties not found"
    exit 1
fi

# Check oozie
type oozie >/dev/null 2>&1 || { 
    echo >&2 "oozie command is required but not found. Aborting." 
    exit 1 
}

echo "Running Email action with the following properties:"
cat workflow.properties

echo "---------------------------------------------------"
oozie job -oozie $OOZIE_SERVER -config workflow.properties -run