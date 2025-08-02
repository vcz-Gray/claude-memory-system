#!/bin/bash
# Claude 명령어 별칭 모음

# 체크포인트 생성
alias claude-save='~/.claude/checkpoint.sh'

# 메모리 상태 보기
alias claude-memory='cat ~/.claude/claude-memory.md'

# 컨텍스트 보기
alias claude-context='cat ~/.claude/claude-context.md'

# 체크포인트 목록
alias claude-checkpoints='ls -la ~/.claude/claude-checkpoint-*.md 2>/dev/null'

# 최근 체크포인트 보기
alias claude-last='ls -t ~/.claude/claude-checkpoint-*.md 2>/dev/null | head -1 | xargs cat'

# Claude 디렉토리로 이동
alias claude-cd='cd ~/.claude'

# 설정 파일 편집
alias claude-edit='${EDITOR:-nano} ~/.claude/CLAUDE.md'

echo "🚀 Claude 별칭이 로드되었습니다!"
echo "사용 가능한 명령어:"
echo "  claude-save [이유]  - 체크포인트 생성"
echo "  claude-memory      - 장기 메모리 확인"
echo "  claude-context     - 현재 세션 확인"
echo "  claude-checkpoints - 체크포인트 목록"
echo "  claude-last        - 최근 체크포인트"
echo "  claude-cd          - Claude 디렉토리 이동"
echo "  claude-edit        - CLAUDE.md 편집"