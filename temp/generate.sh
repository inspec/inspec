
# iterate based on input
for RESOURCE_NAME in "$@"; do
CLASS_NAME=$(echo "$RESOURCE_NAME" | awk -F'-' '{for(i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) tolower(substr($i,2))}1' OFS='')
bundle exec inspec init resource "$RESOURCE_NAME" --overwrite true --path "/Users/balasubs/ProgressChef/resource-packs/$RESOURCE_NAME" --layout resource-pack-project --template project --class_name $CLASS_NAME --no-prompt
echo "Generated $CLASS_NAME packs"
done

