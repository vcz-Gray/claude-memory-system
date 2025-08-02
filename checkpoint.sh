#!/bin/bash
# Claude 간단 체크포인트 시스템

CLAUDE_DIR="$HOME/.claude"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

# 체크포인트 파일 생성
cat > "$CLAUDE_DIR/claude-checkpoint-$TIMESTAMP.md" << EOF
# Claude Checkpoint
Generated: $TIMESTAMP
Reason: $1

## Memory Snapshot
$(cat "$CLAUDE_DIR/claude-memory.md")

---

## Context Snapshot  
$(cat "$CLAUDE_DIR/claude-context.md")
EOF

echo "✅ Checkpoint saved: claude-checkpoint-$TIMESTAMP.md"

# 오래된 체크포인트 삭제 (최근 3개만 유지)
ls -t "$CLAUDE_DIR"/claude-checkpoint-*.md 2>/dev/null | tail -n +4 | xargs -r rm

# 사용법 안내
if [ -z "$1" ]; then
    echo "💡 Tip: checkpoint.sh \"reason\" 형태로 사용하세요"
fi