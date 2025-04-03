#!/bin/bash

# 目标生成文件，放在脚本所在的当前目录
# 授权 chmod +x generatelibrary.sh
# 执行 ./generatelibrary.sh

OUTPUT_FILE="./im_chat_switch_plugin_libs.dart"

# 检查并删除已存在的 library.dart 文件
if [ -f "$OUTPUT_FILE" ]; then
  echo "Deleting existing library file: $OUTPUT_FILE"
  rm "$OUTPUT_FILE"
fi

# 准备生成文件
echo "// Auto-generated library file" > "$OUTPUT_FILE"
echo "library im_chat_switch_plugin;" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

# 遍历当前目录及其子目录
function process_directory() {
  local dir="$1"
  local indent="$2"

  echo "Processing directory: $dir"

  # 遍历目录中的文件和子目录
  for entry in "$dir"/*; do
    if [ -d "$entry" ]; then
      # 如果是 generated 目录，跳过
      if [[ "$entry" == *"generated"* ]]; then
        echo "Skipping generated directory: $entry"
        continue
      fi

      # 如果是其他目录，写入注释
      local folder_name=$(basename "$entry")
      echo "Found directory: $entry"
      echo "$indent/// $folder_name" >> "$OUTPUT_FILE"
      process_directory "$entry" "  $indent"
    elif [ -f "$entry" ] && [[ "$entry" == *.dart ]]; then
      # 如果是 Dart 文件，写入 export 语句
      local relative_path=${entry#./}
      echo "Found Dart file: $entry"
      echo "export '$relative_path';" >> "$OUTPUT_FILE"
    fi
  done
}

# 开始处理当前目录
echo "Starting to process the current directory..."
process_directory "." ""

echo "Library file generated at $OUTPUT_FILE"
