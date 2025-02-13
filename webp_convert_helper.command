#!/bin/bash

# 設定常數
QUALITY=100
SUCCESS_COLOR="\033[0;32m"
ERROR_COLOR="\033[0;31m"
RESET_COLOR="\033[0m"

# 函數：檢查依賴工具
check_dependencies() {
    if ! command -v cwebp &> /dev/null; then
        echo -e "${ERROR_COLOR}需要安裝 webp 轉換工具...${RESET_COLOR}"
        brew install webp
    fi
}

# 函數：轉換 PNG 到 WebP
convert_to_webp() {
    local input_file="$1"
    local filename="${input_file%.*}"
    local output_file="$filename.webp"

    if cwebp -q "$QUALITY" "$input_file" -o "$output_file" &> /dev/null; then
        echo -e "${SUCCESS_COLOR}成功轉換: $input_file -> $output_file${RESET_COLOR}"
        return 0
    else
        echo -e "${ERROR_COLOR}轉換失敗: $input_file${RESET_COLOR}"
        return 1
    fi
}

main() {
    # 切換到腳本所在目錄
    cd "$(dirname "$0")" || { echo -e "${ERROR_COLOR}無法進入目錄！${RESET_COLOR}"; exit 1; }

    # 檢查依賴
    check_dependencies

    echo "開始轉換 PNG 檔案..."
    local converted_count=0
    local failed_count=0

    # 處理所有 PNG 檔案
    for file in *.png; do
        if [[ -f "$file" ]]; then
            if convert_to_webp "$file"; then
                ((converted_count++))
            else
                ((failed_count++))
            fi
        fi
    done

    # 顯示結果統計
    echo
    echo "轉換完成！"
    echo "成功轉換: $converted_count 個檔案"
    [[ $failed_count -gt 0 ]] && echo -e "${ERROR_COLOR}轉換失敗: $failed_count 個檔案${RESET_COLOR}"
    [[ $converted_count -eq 0 && $failed_count -eq 0 ]] && echo "目錄中沒有找到 PNG 檔案"
}

# 執行主程式
main 