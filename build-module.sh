#!/usr/bin/env bash
repo_root=$(pwd);
repo_name=$(basename ${repo_root});
subst="s/drupal[-_]module[-_]template/${repo_name}/g";

# Replace all occurrences of `drupal-module-template` with the module name.
find ${repo_root} -maxdepth 1 -type f | xargs sed -i  ${subst};

# Rename the files.
mv drupal_module_template.info.yml ${repo_name}.info.yml
mv drupal_module_template.module ${repo_name}.module

# Replace the README.md with README.module.md
mv README.module.md README.md

# Remove the call of build-module.sh in composer and delete it
sed -i "/build-module/d" composer.json
rm build-module.sh
