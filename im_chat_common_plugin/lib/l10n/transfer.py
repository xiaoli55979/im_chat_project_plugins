import json
import base64

def process_file(file_path, mode="encode"):
    # 打开并读取 arb 文件
    with open(file_path, 'r', encoding='utf-8') as f:
        arb_data = json.load(f)

    # 遍历文件内容
    for key, value in arb_data.items():
        # 跳过以 @@ 开头的键
        if key.startswith("@@"):
            continue
        if mode == "encode":
            # 将值进行 Base64 编码
            arb_data[key] = base64.b64encode(value.encode('utf-8')).decode('utf-8')
        elif mode == "decode":
            try:
                # 将值进行 Base64 解码
                arb_data[key] = base64.b64decode(value).decode('utf-8')
            except (ValueError, UnicodeDecodeError) as e:
                print(f"解码失败，键: {key}, 值: {value}，错误: {e}")
                # 可以选择将原值保留或设置为 None
                arb_data[key] = None

    # 保存处理后的内容
    output_file = file_path
    with open(output_file, 'w', encoding='utf-8') as f:
        json.dump(arb_data, f, ensure_ascii=False, indent=2)

    print(f"处理完成，结果已保存到 {output_file}")

# 使用示例
file_path = 'intl_zh.arb'
# 设置 mode 为 'encode' 进行编码, 设置 'decode' 进行解码
process_file(file_path, mode="encode")
