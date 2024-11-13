#!/usr/bin/env bash

java -jar ./tools/res_generator.jar type=icon icon_folder_path=./assets/icons icon_code_file_path=./lib/app/res/icons.dart class_name=AppIcons icon_path_prefix=assets/icons/ icon_file_name_prefix=ic_ standardize_file_name=true
