#!/usr/bin/env zsh

# Get the list of projects
PROJECTS=$(gcloud projects list --format="value(projectId)" 2>/dev/null)

# Create an empty array to store projects with running instances
PROJECTS_WITH_RUNNING_INSTANCES=()

# Loop through each project and list the VMs
for PROJECT in $PROJECTS; do
  # Get the list of running instances
  RUNNING_INSTANCES=$(gcloud compute instances list --project $PROJECT --format="value(name)" | wc -l 2>/dev/null)

  echo -e "Project: $PROJECT \n     $RUNNING_INSTANCES instances found"

  if ((RUNNING_INSTANCES > 0)); then
    # Add the project to the array if it has running instances
    PROJECTS_WITH_RUNNING_INSTANCES+=("$PROJECT")
  fi
done

echo -e "\n\n"

if [[ ${#PROJECTS_WITH_RUNNING_INSTANCES[@]} -gt 0 ]]; then
  echo "Projects with VM instances:"
  echo "${PROJECTS_WITH_RUNNING_INSTANCES[@]}"
else
  echo "No projects with VM instances found."
fi
