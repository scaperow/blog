#!/usr/bin/env bash
# 给文章加/去密码。
#
#   加密:   ./scripts/encrypt-post.sh 6qIu7a
#   解密:   ./scripts/encrypt-post.sh 6qIu7a --off
#   全部:   ./scripts/encrypt-post.sh --all
#
# 参数是文章文件名（不带 .md）或 abbrlink，例如 6qIu7a。
# 密码取自环境变量 BLOG_ENCRYPT_PASSWORD，不写进文件。
set -euo pipefail

cd "$(dirname "$0")/.."
POSTS_DIR="source/_posts"
KEY="password"

usage() {
  echo "用法: $0 <文章名|abbrlink|--all> [--off]" >&2
  echo "例:   $0 6qIu7a" >&2
  echo "      $0 6qIu7a --off" >&2
  exit 1
}

[ $# -ge 1 ] || usage
TARGET="$1"
MODE="${2:-on}"

# front-matter 里要写入的行
if [ "$MODE" = "--off" ]; then
  VALUE='""'          # 空字符串 = 显式不加密
else
  VALUE='{ env: BLOG_ENCRYPT_PASSWORD }'
fi

find_post() {
  local t="$1"
  if [ -f "$POSTS_DIR/$t.md" ]; then echo "$POSTS_DIR/$t.md"; return; fi
  grep -rl "^abbrlink: \"$t\"" "$POSTS_DIR" 2>/dev/null | head -1
}

edit_one() {
  local f="$1"
  if grep -q "^${KEY}:" "$f"; then
    # 已有该字段：替换整行（兼容带引号/不带引号）
    python3 - "$f" "$VALUE" <<'PY'
import re, sys
path, value = sys.argv[1], sys.argv[2]
lines = open(path, encoding="utf-8").read().split("\n")
out, done = [], False
for line in lines:
    if not done and re.match(r'^password:', line):
        out.append(f'password: {value}')
        done = True
    else:
        out.append(line)
open(path, "w", encoding="utf-8").write("\n".join(out))
PY
  else
    # 没有该字段：插到 abbrlink 后（没有就插在 front-matter 结尾前）
    python3 - "$f" "$VALUE" <<'PY'
import sys
path, value = sys.argv[1], sys.argv[2]
lines = open(path, encoding="utf-8").read().split("\n")
if not (lines and lines[0].strip() == "---"):
    sys.exit(f"{path}: 不是标准 front-matter")
insert_at = None
for i, line in enumerate(lines[1:], start=1):
    if line.startswith("abbrlink:"):
        insert_at = i + 1
        break
    if line.strip() == "---":
        insert_at = i
        break
lines.insert(insert_at, f"password: {value}")
open(path, "w", encoding="utf-8").write("\n".join(lines))
PY
  fi
  echo "  ${MODE/--off/=关闭}: $(basename "$f")"
}

if [ "$TARGET" = "--all" ]; then
  count=0
  for f in "$POSTS_DIR"/*.md; do edit_one "$f"; count=$((count+1)); done
  echo "共处理 $count 篇"
else
  f="$(find_post "$TARGET")"
  if [ -z "$f" ]; then echo "找不到文章: $TARGET" >&2; exit 1; fi
  edit_one "$f"
fi

echo
echo "完成。记得提交并推送，CI 会用 BLOG_ENCRYPT_PASSWORD 构建。"
