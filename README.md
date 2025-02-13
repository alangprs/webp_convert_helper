# PNG to WebP 轉換工具

一個簡單的命令列工具，用於將 PNG 圖片批次轉換為 WebP 格式。

## 功能特點

- 自動轉換目錄內所有 PNG 檔案為 WebP 格式
- 保持原始檔名（副檔名改為 .webp）
- 自動檢查並安裝 webp 轉換工具
- 顯示轉換結果統計

## 系統需求

- macOS 系統
- Homebrew 套件管理器

## 使用方法

1. 將 `webp_convert_helper.command` 放到包含 PNG 圖片的資料夾中
2. 開啟終端機，執行以下指令賦予執行權限：
   ```bash
   chmod +x /path/to/webp_convert_helper.command
   ```
3. 雙擊執行 `webp_convert_helper.command` 或在終端機中執行：
   ```bash
   ./webp_convert_helper.command
   ```

## 輸出說明

- 綠色文字：成功轉換的檔案
- 紅色文字：轉換失敗的檔案或錯誤訊息
- 最後會顯示轉換統計（成功/失敗數量）

## 注意事項

- 轉換品質固定為 100（最高品質）
- 轉換後的 WebP 檔案會與原始 PNG 檔案存放在同一目錄
- 如果缺少 webp 轉換工具，腳本會自動透過 Homebrew 安裝 